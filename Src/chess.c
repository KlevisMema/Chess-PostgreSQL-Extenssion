/*
 * Implementation of chess game-related functions for a PostgreSQL extension.
 *
 * This source file contains functions to handle chess data types SAN and FEN.
 * It includes input and output functions for these data types, along with utilities
 * for processing chess game notations and board states.
 *
 */

#include "chess.h"
#include <ctype.h>
#include <string.h>
#include <stdbool.h>
#include "libpq/pqformat.h"
#include "Utils/mapping_san_to_fan.h"

/**
 * Inputs a SAN string into PostgreSQL.
 *
 * This function takes a SAN string as input and allocates a SAN structure
 * to store the string. It sets the varlena length of the result and copies
 * the PGN string into the flexible array member of the SAN structure.
 *
 * @param fcinfo Function call info containing arguments.
 * @return A SAN structure containing the input string.
 */
Datum san_in(PG_FUNCTION_ARGS)
{
    SAN *result;
    char *pgn_str;

    if (PG_ARGISNULL(0))
        ereport(ERROR, (errmsg("san_in: Argument(0) is null")));

    pgn_str = PG_GETARG_CSTRING(0);

    result = (SAN *) palloc(sizeof(SAN));

    parseStr_ToPGN(pgn_str, result);

    PG_RETURN_POINTER(result);
}
/**
 * Outputs a SAN string from PostgreSQL.
 *
 * This function retrieves a SAN structure from PostgreSQL and returns
 * the stored SAN string. It duplicates the SAN string to ensure that the
 * returned value is a null-terminated C string.
 *
 * @param fcinfo Function call info containing arguments.
 * @return The SAN string contained in the SAN structure.
 */
Datum san_out(PG_FUNCTION_ARGS)
{
    SAN *game;
    char *result;

    if (PG_ARGISNULL(0))
        ereport(ERROR, (errmsg("san_out: Argument(0) is null")));

    game = PG_GETARG_CHESSGAME_P(0);

    parsePGN_ToStr(game, &result);

    PG_RETURN_CSTRING(result);
}
/**
 * Inputs a FEN string into PostgreSQL.
 *
 * This function takes a FEN string as input, validates it using the 
 * isValidFEN function, and then allocates and populates a FEN structure.
 * If the input FEN string is invalid, an error is reported.
 *
 * @param fcinfo Function call info containing arguments.
 * @return A FEN structure populated based on the input FEN string.
 */
Datum fen_in(PG_FUNCTION_ARGS)
{
    char *str;
    FEN *result;

    if (PG_ARGISNULL(0))
        ereport(ERROR, (errmsg("fen_in: Argument(0) is null")));

    str = PG_GETARG_CSTRING(0);

    if (!isValidFEN(str))
        ereport(ERROR,
                (errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
                 errmsg("invalid FEN representation: %s", str)));

    result = (FEN *)palloc(sizeof(FEN));

    parseStr_ToFEN(str, result);

    PG_RETURN_POINTER(result);
}
/**
 * Outputs a FEN structure as a string in PostgreSQL.
 *
 * This function takes a FEN structure as input and converts it to a string
 * using the parseFEN_ToStr function. The result is duplicated to ensure
 * it is a null-terminated C string suitable for returning to PostgreSQL.
 *
 * @param fcinfo Function call info containing arguments.
 * @return A string representing the FEN structure.
 */
Datum fen_out(PG_FUNCTION_ARGS)
{
    FEN *cb;
    char* result;

    if (PG_ARGISNULL(0))
        ereport(ERROR, (errmsg("fen_out: Argument(0) is null")));

    cb = (FEN *)PG_GETARG_POINTER(0);

    result = parseFEN_ToStr(cb);

    PG_RETURN_CSTRING(pstrdup(result));
}
/**
 * Checks if a chess game has a specific opening sequence.
 *
 * This function compares two SAN structures to determine if the first one
 * starts with the same set of moves as the second one. It is used to check
 * if a chess game contains a specific opening sequence.
 *
 * @param fcinfo Function call info containing arguments.
 * @return True if the first game starts with the same moves as the second game; false otherwise.
 */
Datum has_opening(PG_FUNCTION_ARGS) 
{
    int opening_length;
    SAN *game1, *game2;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("has_opening: One of the arguments is null")));

    game1 = (SAN*)PG_GETARG_POINTER(0);
    game2 = (SAN*)PG_GETARG_POINTER(1);

    opening_length = strlen(game2->data);

    if (opening_length > 0 && strncmp(game1->data, game2->data, opening_length) == 0)
        PG_RETURN_BOOL(true);

    PG_RETURN_BOOL(false);
}
/**
 * Retrieves the first N half-moves of a chess game.
 *
 * This function truncates a SAN structure representing a chess game to its
 * first N half-moves. It uses the truncate_san function to create a new SAN
 * structure containing only the specified initial moves.
 *
 * @param fcinfo Function call info containing arguments.
 * @return A new SAN structure containing the first N half-moves of the game.
 */
Datum get_FirstMoves(PG_FUNCTION_ARGS) 
{
    SAN *result, *inputGame;
    int nHalfMoves;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("get_FirstMoves: One of the arguments is null")));
   
    inputGame = (SAN *) PG_GETARG_POINTER(0);
    nHalfMoves = PG_GETARG_INT32(1);

    if (nHalfMoves < 0) 
        ereport(ERROR,(errmsg("get_FirstMoves: Non-positive number of half moves")));

    result = truncate_san(inputGame, nHalfMoves); 

    if (result == NULL)
        ereport(ERROR, (errmsg("Game is incomplete or shorter than the requested number of half-moves")));

    PG_RETURN_POINTER(result);
}
/**
 * Retrieves the board state at a specific half-move in a chess game.
 *
 * This function takes a SAN structure and an integer representing half-moves,
 * truncates the game to the specified number of half-moves, converts it to FEN format,
 * and then returns the resulting board state as a FEN structure.
 *
 * @param fcinfo Function call info containing arguments.
 * @return A FEN structure representing the board state at the specified half-move.
 */
Datum get_board_state(PG_FUNCTION_ARGS) {
    FEN *fen;
    SAN *gameTruncated, *game;

    int half_moves;
    const char *fenConversionStrResult;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("get_board_state: One of the arguments is null")));

    game = (SAN *) PG_GETARG_POINTER(0);
    half_moves = PG_GETARG_INT32(1);

    if (half_moves < 0) 
        ereport(ERROR,(errmsg("get_board_state: Non-positive number of half moves")));

    gameTruncated = truncate_san(game, half_moves); 

    if (gameTruncated == NULL)
        ereport(ERROR, (errmsg("Game is incomplete or shorter than the requested number of half-moves")));

    fenConversionStrResult = san_to_fan(gameTruncated);

    if (fenConversionStrResult == NULL) {
        ereport(ERROR, (errmsg("No FEN result returned from mapping san to fen")));
    }

    fen = (FEN *)palloc(sizeof(FEN));

    parseStr_ToFEN(fenConversionStrResult, fen);

    PG_RETURN_POINTER(fen);
}
/**
 * Checks if a chess game contains a specific board state within the first N half-moves.
 *
 * This function compares the board state of a chess game at a specified number
 * of half-moves with a given board state. It is used to check if a specific
 * board configuration occurs within the first N half-moves of the game.
 *
 * @param fcinfo Function call info containing arguments.
 * @return True if the game contains the given board state within the first N half-moves; false otherwise.
 */
Datum has_Board(PG_FUNCTION_ARGS){
    FEN *current_board, *input_board;
    SAN *gameTruncated, *input_game;

    int input_half_moves;
    bool positions_match;
    const char *fenConversionStrResult;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1) || PG_ARGISNULL(2))
        ereport(ERROR, (errmsg("has_Board: One of the arguments is null")));

    input_game = (SAN*) PG_GETARG_POINTER(0);
    input_board = (FEN*) PG_GETARG_POINTER(1);
    input_half_moves = PG_GETARG_INT32(2);

    if (input_half_moves < 0) 
        ereport(ERROR,(errmsg("hasBoard: Non-positive number of half moves")));

    gameTruncated = truncate_san(input_game, input_half_moves); 

    if (gameTruncated == NULL)
        ereport(ERROR, (errmsg("Game is incomplete or shorter than the requested number of half-moves")));

    fenConversionStrResult = san_to_fan(gameTruncated);

    if (fenConversionStrResult == NULL) {
        ereport(ERROR, (errmsg("No FEN result returned from mapping san to fen")));
    }

    current_board = (FEN *)palloc(sizeof(FEN));

    parseStr_ToFEN(fenConversionStrResult, current_board);

    positions_match = strcmp(input_board->positions, current_board->positions) == 0;

    PG_RETURN_BOOL(positions_match);
}
/**
 * Compares two SAN types for equality.
 *
 * Determines if the game notations of two SAN types are equal up to the first MAX_PGN_LENGTH characters.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Boolean value - true if the two SAN types are equal; false otherwise.
 */
Datum san_eq(PG_FUNCTION_ARGS) {
    SAN *san1, *san2;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_eq: One of the arguments is null")));

    san1 = (SAN *) PG_GETARG_POINTER(0);
    san2 = (SAN *) PG_GETARG_POINTER(1);

    PG_RETURN_BOOL(strncmp(san1->data, san2->data, MAX_PGN_LENGTH) == 0);
}
/**
 * Compares two SAN types to determine if the first is less than the second.
 *
 * Compares the game notations of two SAN types up to the first MAX_PGN_LENGTH characters.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Boolean value - true if the first SAN type is less than the second; false otherwise.
 */
Datum san_lt(PG_FUNCTION_ARGS) {
    SAN *san1 , *san2;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_lt: One of the arguments is null")));

    san1 = (SAN *) PG_GETARG_POINTER(0);
    san2 = (SAN *) PG_GETARG_POINTER(1);

    PG_RETURN_BOOL(strncmp(san1->data, san2->data, MAX_PGN_LENGTH) < 0);
}
/**
 * Compares two SAN types to determine if the first is greater than the second.
 *
 * Compares the game notations of two SAN types up to the first MAX_PGN_LENGTH characters.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Boolean value - true if the first SAN type is greater than the second; false otherwise.
 */
Datum san_gt(PG_FUNCTION_ARGS) {
    SAN *san1, *san2;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_gt: One of the arguments is null")));

    san1 = (SAN *) PG_GETARG_POINTER(0);
    san2 = (SAN *) PG_GETARG_POINTER(1);

    PG_RETURN_BOOL(strncmp(san1->data, san2->data, MAX_PGN_LENGTH) > 0);
}
/**
 * Compares two SAN types.
 *
 * Returns an integer indicating the relationship between two SAN types based on their game notations.
 * The comparison is up to the first MAX_PGN_LENGTH characters.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Integer less than, equal to, or greater than zero if the first SAN is found,
 * respectively, to be less than, to match, or be greater than the second SAN.
 */
Datum san_cmp(PG_FUNCTION_ARGS) {
    SAN *san1, *san2;

    int cmp;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_cmp: One of the arguments is null")));

    san1 = (SAN *) PG_GETARG_POINTER(0);
    san2 = (SAN *) PG_GETARG_POINTER(1);

    cmp = strncmp(san1->data, san2->data, MAX_PGN_LENGTH);
    PG_RETURN_INT32(cmp);
}
/**
 * Determines if a SAN type matches a given pattern using the LIKE operation.
 *
 * Compares a SAN type's game notation to a text pattern. Useful for pattern matching operations in queries.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Boolean value - true if the SAN type matches the pattern; false otherwise.
 */
Datum san_like(PG_FUNCTION_ARGS)
{
    SAN *san;
    text *pattern, *san_text;

    bool result;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_like: One of the arguments is null")));

    san = (SAN *) PG_GETARG_POINTER(0);
    pattern = PG_GETARG_TEXT_PP(1);
    san_text = cstring_to_text(san->data);

    result = DatumGetBool(DirectFunctionCall2(textlike, 
                                                   PointerGetDatum(san_text), 
                                                   PointerGetDatum(pattern)));

    pfree(san_text);

    PG_RETURN_BOOL(result);
}
/**
 * Determines if a SAN type does not match a given pattern using the NOT LIKE operation.
 *
 * Compares a SAN type's game notation to a text pattern and returns the opposite of the LIKE operation result.
 *
 * @param fcinfo Function call info containing arguments.
 * @return Boolean value - true if the SAN type does not match the pattern; false otherwise.
 */
Datum san_not_like(PG_FUNCTION_ARGS)
{
    SAN *san;
    text *pattern, *san_text;

    bool like_result;

    if (PG_ARGISNULL(0) || PG_ARGISNULL(1))
        ereport(ERROR, (errmsg("san_not_like: One of the arguments is null")));
    
    san = (SAN *) PG_GETARG_POINTER(0);
    pattern = PG_GETARG_TEXT_PP(1);
    san_text = cstring_to_text(san->data);

    like_result = DatumGetBool(DirectFunctionCall2(textlike, 
                                                        PointerGetDatum(san_text), 
                                                        PointerGetDatum(pattern)));

    pfree(san_text);

    PG_RETURN_BOOL(!like_result);
}