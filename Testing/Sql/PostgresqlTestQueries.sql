create extension chess_type_extension;

--  Table for testing
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game chessgame
);

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Validators test---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. Qh9');
-- Expected Result: Error

--INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. O-O Nf6');

--INSERT INTO test_chess_games (game) VALUES ('1. e4 2. d5');

-- dont try it yet not finished 


------------------------------------------------------------------------------------------------------------------------
-------------------------------------has opening functions test---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Insert test data
-- Test 1: Basic Matching Opening Moves
INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6');
-- Test 2: Non-Matching Opening Moves
INSERT INTO test_chess_games (game) VALUES ('1. d4 d5 2. c4 e6');
-- Test 3: Empty String Cases
INSERT INTO test_chess_games (game) VALUES ('');
INSERT INTO test_chess_games (game) VALUES ('1. e4');
-- and so on for other test cases...

-- Execute tests
-- Test 1: Expect TRUE
SELECT has_opening(
    '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6',
    '1. e4 e5 2. Nf3'
) AS result;

-- Test 2: Expect FALSE
SELECT has_opening(
    '1. Nf2 Nf6 2. c4 g6 3. Nc3 Bg7 4. d4 O-O 5. Bf4 d5 6. Qb3 dxc4',
    '1. Nf3'
) AS result;

-- Test 3a: Expect FALSE
SELECT has_opening(
    (SELECT game FROM test_chess_games WHERE id = 3),
    '1. e4'
) AS result;

-- Test 3b: Expect FALSE
SELECT has_opening(
    (SELECT game FROM test_chess_games WHERE id = 4),
    ''
) AS result;

-- Clean up
DROP TABLE test_chess_games;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
-----------------------------------------get first moves function test--------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- general tests
INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6');
INSERT INTO test_chess_games (game) VALUES ('1. d4 d5 2. c4 c6');
INSERT INTO test_chess_games (game) VALUES ('1. Nf3 Nf6 2. c4 g6');

select *
from test_chess_games;

SELECT get_FirstMoves(game, -1) FROM test_chess_games WHERE id = 1;

SELECT get_FirstMoves(game, 6) FROM test_chess_games WHERE id = 2;


-- more tests *special cases that cover various scenarios, including the presence of comments, annotations, and special
-- moves in the PGN strings.
INSERT INTO test_chess_games (game) VALUES ('2. e4 e5 3. Nf3 Nc6 {A comment} 4. Bb5 a6 (A annotation)');
INSERT INTO test_chess_games (game) VALUES ('1. e4 {Comment} e5 2. Nf3 Nc6');
INSERT INTO test_chess_games (game) VALUES ('1. e4 (Annotation) e5 2. Nf3 Nc6');
INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 2. O-O Nc6'); -- Castling
INSERT INTO test_chess_games (game) VALUES ('1. e4 d5 2. exd5 Qxd5 {En passant possible next}');
INSERT INTO test_chess_games (game) VALUES ('1. e4 e5 {This is a comment} 2. Nf3 Nc6 (Nc3 is also possible) 3. Bb5 a6 4. O-O {Castling} 5. Bxc6 dxc6 6. d4 exd4 (6...Bg4 {Another comment})');


select  * from test_chess_games;

SELECT get_FirstMoves(game, 5) FROM test_chess_games WHERE id = 1;
SELECT get_FirstMoves(game, 10) FROM test_chess_games WHERE id = 7;
-- Expected Result: '1. e4 e5 2. Nf3 Nc6 3. Bb5 '
-- This test checks if the function correctly skips over comments and annotations.

SELECT get_FirstMoves(game, 2) FROM test_chess_games WHERE id = 2;
-- Expected Result: '1. e4 e5'
-- This test evaluates how the function handles comments in the middle of moves.

SELECT get_FirstMoves(game, 2) FROM test_chess_games WHERE id = 3;
-- Expected Result: '1. e4 e5'
-- This test assesses the handling of annotations within moves.

SELECT get_FirstMoves(game, 3) FROM test_chess_games WHERE id = 4;
-- Expected Result: '1. e4 e5 2. O-O'
-- This test ensures that special moves like castling are correctly counted as half-moves.

SELECT get_FirstMoves(game, 4) FROM test_chess_games WHERE id = 5;
-- Expected Result: '1. e4 d5 2. exd5 Qxd5'
-- This test checks the handling of moves leading to potential en passant situations.

SELECT get_FirstMoves(game, 9) FROM test_chess_games WHERE id = 6;
-- Expected Result: '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. O-O 5. Bxc6'
-- This result should include the first 10 half-moves, correctly skipping over the comments and annotations,
-- and properly handling the castling notation.