create extension chess;

------------------------------------------------------------------------------------------------------------------------
-------------------------------------SAN Data type testing inserting/reading--------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--  Table for SAN 'chessgame' data type
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
);

INSERT INTO test_chess_games (id, game) VALUES (1,' 1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0');
INSERT INTO test_chess_games (id, game) VALUES (2, '1. Nf3 Nf6 2. b3 g6 3. Bb2 Bg7 4. g3 d6 5. Bg2 O-O 6. O-O c6 7. d3 e5 8. c4 Ne8 9. Nbd2 f5 10. Qc2 Na6 11. c5 Nxc5 12. Nxe5 Qe7 13. d4 Na6 14. Qc4+ Kh8 15. Nef3 Be6 16. Qc3 f4 17. gxf4 Rxf4 18. Qe3 Rf8 19. Ng5 Nec7 20. Nc4 Rae8 21. Nxe6 Qxe6 22. Qxe6 Rxe6 23. e3 d5 24. Ne5 g5 25. Ba3 Rff6 26. Bh3 Re8 27. Bd7 Rd8 28. Be7 Rxd7 29. Bxf6 1-0');
INSERT INTO test_chess_games (id, game) VALUES (3, '1. d4 Nf6 2. Nf3 g6 3. Bf4 Bg7 4. e3 d6 5. h3 O-O 6. Nbd2 Nbd7 7. Bc4 c6 8. a4 Re8 9. O-O e5 10. Bh2 e4 11. Ne1 Nf8 12. Qe2 a5 13. c3 b6 14. b4 axb4 15. cxb4 d5 16. Bb3 Ba6 17. Qd1 Bxf1 0-1');
INSERT INTO test_chess_games (id, game) VALUES (4, '1. e4 c5 2. Nf3 e6 3. d4 cxd4 4. Nxd4 Nf6 5. Bd3 Nc6 6. Nxc6 bxc6 7. O-O d5 8. exd5 cxd5 9. Qf3 Bd6 10. Bg5 Be7 11. Nd2 O-O 12. c4 Bb7 13. Bc2 Qb6 14. Qd3 dxc4 15. Qh3 g6 16. Nxc4 Qc6 17. Ne3 Nd5 18. Bxe7 Nxe7 19. Rac1 Qb5 20. Qh4 Nd5 21. Ba4 Qb6 22. Ng4 h5 23. Ne5 Qd6 24. Qg5 Kg7 25. Rfd1 Qd8 26. Qg3 Rh8 27. h4 Qf6 28. Rc4 Rac8 29. Rcd4 Qf5 30. Nc4 Rb8 31. R1d3 Nf6 32. Nd6 Qa5 33. f3 Ba6 34. Rd2 Rb4 35. Bb3 Rxd4 36. Rxd4 Qc5 37. Qf2 Qc1+ 38. Kh2 Qc7 39. Qg3 Qc5 40. Rd2 Qe3 41. Qg5 Qe1 42. Rd1 Qe2 43. Rd2 1/2-1/2');
INSERT INTO test_chess_games (id, game) VALUES (5, '1. e4 e5 2. f4 exf4 3. Nf3 g5 4. Bc4 g4 5. Nc3 gxf3 6. O-O d6 7. Qxf3 c6 8. d4 Bh6 9. Bxf7+ Kxf7 10. Qh5+ Kg7 11. Bxf4 Bxf4 12. Rxf4 Nf6 13. Qg5+ Kf7 14. e5 dxe5 15. dxe5 Nd7 16. Ne4 Rg8 17. Qh5+ Kg7 18. exf6+ Kh8 19. Rh4 Nf8 20. Ng5 Rxg5 21. Qxg5 Ne6 22. Qh5 Qg8 23. f7 Qg7 24. Rg4 Qf8 25. Qe5+ Ng7 26. Rxg7 Qxg7 27. f8=Q+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (6, '1. e4 e5 2. Nf3 Qf6 3. d4 exd4 4. Bg5 Qg6 5. Bd3 Bc5 6. O-O Ne7 7. Nbd2 O-O 8. Nb3 Bb4 9. a3 Bd6 10. e5 Qe6 11. Nbxd4 Qd5 12. exd6 cxd6 13. Bxe7 Re8 14. Nf5 Nc6 15. Nxd6 Rxe7 16. Bxh7+ Kf8 17. Qxd5 a6 18. Nh4 g6 19. Rae1 b5 20. Rxe7 Kg7 21. Qxf7+ Kh6 22. Qxg6+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (7, '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 O-O 8. c3 d6 9. h3 Na5 10. Bc2 c5 11. d4 Qc7 12. Nbd2 Nc6 13. dxc5 dxc5 14. Nf1 Be6 15. Nh4 g6 16. Qf3 Kh8 17. Bg5 Ng8 18. Qg3 f5 19. f4 Bd6 20. exf5 Bxf5 21. Nxf5 exf4 22. Qf2 gxf5 23. Rad1 Rac8 24. Re6 Be5 25. Qxc5 Qg7 26. Bxf4 Bxf4 27. Rxc6 Bb8 28. Kh1 Ba7 29. Qd6 Bb8 30. Qe6 Rce8 31. Qd7 Re7 32. Qd4 Be5 33. Qd3 Nf6 34. Qxf5 Nd5 35. Rc8 Rf7 36. Rxf8+ Rxf8 37. Qe4 Nf4 38. Re1 Bd6 39. Qd4 Qxd4 40. cxd4 Ne2 41. Bd1 Bb4 42. Bxe2 Bxe1 43. Bf3 Rf4 44. d5 Ra4 45. a3 b4 46. axb4 Rxb4 47. d6 Rxb2 48. d7 Ba5 49. Ne3 Bc7 50. Kg1 a5 51. Bc6 Rb6 52. Ba4 Rb4 53. Bc6 Rd4 54. Nf5 Rc4 55. Bd5 Rc5 56. Be6 Re5 0-1');
INSERT INTO test_chess_games (id, game) VALUES (8, '1. d4 Nf6 2. c4 e6 3. Nc3 Bb4 4. a3 Bxc3+ 5. bxc3 d6 6. f3 O-O 7. e4 e5 8. Bd3 Nc6 9. Be3 Re8 10. Ne2 b6 11. g4 Na5 12. Ng3 Ba6 13. Qe2 Nd7 14. h4 Nf8 15. f4 exf4 16. Bxf4 Qd7 17. O-O Qa4 18. Nf5 Bxc4 19. Bxc4 Qxc4 20. Qf3 Qe6 21. Rae1 Nc4 22. d5 Qd7 23. Nxg7 Kxg7 24. Bh6+ Kxh6 25. Qf6+ Ng6 26. Rf5 Re5 27. Re2 Rg8 28. Rh5+ Rxh5 29. g5+ Rxg5+ 30. hxg5+ Kh5 31. Rh2+ Kg4 32. Rg2+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (9, '1. e4 e5 2. Nf3 Nc6 3. Bc4 Nf6 4. d4 exd4 5. O-O Bc5 6. e5 d5 7. exf6 dxc4 8. Re1+ Be6 9. Ng5 Qd5 10. Nc3 Qf5 11. Nce4 Bb6 12. fxg7 Rg8 13. g4 Qg6 14. Nxe6 fxe6 15. Bg5 Rxg7 16. Nf6+ Kf8 17. Qf3 Rf7 18. Rxe6 Qxg5 19. Nxh7+ Kg7 20. Qxf7+ Kxf7 21. Nxg5+ Kg7 22. h4 Rf8 23. Rxc6 1-0');
INSERT INTO test_chess_games (id, game) VALUES (10,'1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 Nc6 6. Bg5 e6 7. Qd2 Be7 8. O-O-O O-O 9. Nb3 Qb6 10. f3 Rd8 11. h4 d5 12. Bxf6 Bxf6 13. exd5 Bxc3 14. Qxc3 exd5 15. Qc5 Qc7 16. Bb5 Bf5 17. Bxc6 bxc6 18. g4 Be6 19. Nd4 Bd7 20. h5 Qb6 21. Nb3 Qxc5 22. Nxc5 h6 23. Rhe1 Kf8 24. Rd3 Be8 25. Rd4 Rdc8 26. Rf4 a5 27. Re3 Rab8 28. Ra3 Rb5 29. Ne6+ Kg8 30. Nd4 Rb4 31. Rxa5 c5 32. Ne2 d4 33. Rf5 Rcb8 34. b3 c4 35. a3 R4b6 36. Nxd4 cxb3 37. cxb3 Bd7 38. Rf4 Rd6 39. b4 Rd8 40. Kc2 1-0');

select * from test_chess_games;

-- Clean up
DROP TABLE test_chess_games;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------
---------------------------------------FEN Data type testing inserting/reading------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--  Table for FEN 'chessboard' data type
CREATE TABLE test_chess_board (
    id serial PRIMARY KEY,
    gameboard FEN
);

-- Inserting data
INSERT INTO test_chess_board (gameboard) VALUES ('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');
INSERT INTO test_chess_board (gameboard) VALUES ('rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2');

-- Read form the table
SELECT * FROM test_chess_board;

-- Clean up
DROP TABLE test_chess_board;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------------------
-----------------------------------------has opening functions test-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--  Table for SAN 'chessgame' data type
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
);

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
) AS result;test_chess_games

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

--  Table for SAN 'chessgame' data type
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
);

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

-- Clean up
DROP TABLE test_chess_games;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------------------
--------------------------------------------get board state function test-----------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--  Table for SAN 'chessgame' data type
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
);

INSERT INTO test_chess_games (id, game) VALUES (1,' 1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0');

SELECT get_board_state('1. e4 e5 2. Nf3', 0);
-- Expected Result : 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

SELECT get_board_state('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 ', 1);
-- Expected Result : 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1'

select get_board_state(game, 2) FROM test_chess_games WHERE id = 1;
-- Expected Result : 'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2'


-- Clean up
DROP TABLE test_chess_games;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------has board state function test--------------------------------------------
------------------------------------------------------------------------------------------------------------------------

SELECT has_board('Invalid SAN string', 'invalid FEN string', 5);
-- Expected Result :  'failed to parse FEN string: invalid FEN string'

SELECT has_board('1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 a6', 'rnbqkb1r/1p2pppp/p2p1n2/8/3NP3/2N5/PPP2PPP/R1BQKB1R b KQkq - 0 5', 10);
-- Expected Result : 'true'

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------More tests-------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--  Table for SAN 'chessgame' data type
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
);

-- Inserting data
INSERT INTO test_chess_games (id, game) VALUES (1,' 1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0');
INSERT INTO test_chess_games (id, game) VALUES (2, '1. Nf3 Nf6 2. b3 g6 3. Bb2 Bg7 4. g3 d6 5. Bg2 O-O 6. O-O c6 7. d3 e5 8. c4 Ne8 9. Nbd2 f5 10. Qc2 Na6 11. c5 Nxc5 12. Nxe5 Qe7 13. d4 Na6 14. Qc4+ Kh8 15. Nef3 Be6 16. Qc3 f4 17. gxf4 Rxf4 18. Qe3 Rf8 19. Ng5 Nec7 20. Nc4 Rae8 21. Nxe6 Qxe6 22. Qxe6 Rxe6 23. e3 d5 24. Ne5 g5 25. Ba3 Rff6 26. Bh3 Re8 27. Bd7 Rd8 28. Be7 Rxd7 29. Bxf6 1-0');
INSERT INTO test_chess_games (id, game) VALUES (3, '1. d4 Nf6 2. Nf3 g6 3. Bf4 Bg7 4. e3 d6 5. h3 O-O 6. Nbd2 Nbd7 7. Bc4 c6 8. a4 Re8 9. O-O e5 10. Bh2 e4 11. Ne1 Nf8 12. Qe2 a5 13. c3 b6 14. b4 axb4 15. cxb4 d5 16. Bb3 Ba6 17. Qd1 Bxf1 0-1');
INSERT INTO test_chess_games (id, game) VALUES (4, '1. e4 c5 2. Nf3 e6 3. d4 cxd4 4. Nxd4 Nf6 5. Bd3 Nc6 6. Nxc6 bxc6 7. O-O d5 8. exd5 cxd5 9. Qf3 Bd6 10. Bg5 Be7 11. Nd2 O-O 12. c4 Bb7 13. Bc2 Qb6 14. Qd3 dxc4 15. Qh3 g6 16. Nxc4 Qc6 17. Ne3 Nd5 18. Bxe7 Nxe7 19. Rac1 Qb5 20. Qh4 Nd5 21. Ba4 Qb6 22. Ng4 h5 23. Ne5 Qd6 24. Qg5 Kg7 25. Rfd1 Qd8 26. Qg3 Rh8 27. h4 Qf6 28. Rc4 Rac8 29. Rcd4 Qf5 30. Nc4 Rb8 31. R1d3 Nf6 32. Nd6 Qa5 33. f3 Ba6 34. Rd2 Rb4 35. Bb3 Rxd4 36. Rxd4 Qc5 37. Qf2 Qc1+ 38. Kh2 Qc7 39. Qg3 Qc5 40. Rd2 Qe3 41. Qg5 Qe1 42. Rd1 Qe2 43. Rd2 1/2-1/2');
INSERT INTO test_chess_games (id, game) VALUES (5, '1. e4 e5 2. f4 exf4 3. Nf3 g5 4. Bc4 g4 5. Nc3 gxf3 6. O-O d6 7. Qxf3 c6 8. d4 Bh6 9. Bxf7+ Kxf7 10. Qh5+ Kg7 11. Bxf4 Bxf4 12. Rxf4 Nf6 13. Qg5+ Kf7 14. e5 dxe5 15. dxe5 Nd7 16. Ne4 Rg8 17. Qh5+ Kg7 18. exf6+ Kh8 19. Rh4 Nf8 20. Ng5 Rxg5 21. Qxg5 Ne6 22. Qh5 Qg8 23. f7 Qg7 24. Rg4 Qf8 25. Qe5+ Ng7 26. Rxg7 Qxg7 27. f8=Q+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (6, '1. e4 e5 2. Nf3 Qf6 3. d4 exd4 4. Bg5 Qg6 5. Bd3 Bc5 6. O-O Ne7 7. Nbd2 O-O 8. Nb3 Bb4 9. a3 Bd6 10. e5 Qe6 11. Nbxd4 Qd5 12. exd6 cxd6 13. Bxe7 Re8 14. Nf5 Nc6 15. Nxd6 Rxe7 16. Bxh7+ Kf8 17. Qxd5 a6 18. Nh4 g6 19. Rae1 b5 20. Rxe7 Kg7 21. Qxf7+ Kh6 22. Qxg6+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (7, '1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 O-O 8. c3 d6 9. h3 Na5 10. Bc2 c5 11. d4 Qc7 12. Nbd2 Nc6 13. dxc5 dxc5 14. Nf1 Be6 15. Nh4 g6 16. Qf3 Kh8 17. Bg5 Ng8 18. Qg3 f5 19. f4 Bd6 20. exf5 Bxf5 21. Nxf5 exf4 22. Qf2 gxf5 23. Rad1 Rac8 24. Re6 Be5 25. Qxc5 Qg7 26. Bxf4 Bxf4 27. Rxc6 Bb8 28. Kh1 Ba7 29. Qd6 Bb8 30. Qe6 Rce8 31. Qd7 Re7 32. Qd4 Be5 33. Qd3 Nf6 34. Qxf5 Nd5 35. Rc8 Rf7 36. Rxf8+ Rxf8 37. Qe4 Nf4 38. Re1 Bd6 39. Qd4 Qxd4 40. cxd4 Ne2 41. Bd1 Bb4 42. Bxe2 Bxe1 43. Bf3 Rf4 44. d5 Ra4 45. a3 b4 46. axb4 Rxb4 47. d6 Rxb2 48. d7 Ba5 49. Ne3 Bc7 50. Kg1 a5 51. Bc6 Rb6 52. Ba4 Rb4 53. Bc6 Rd4 54. Nf5 Rc4 55. Bd5 Rc5 56. Be6 Re5 0-1');
INSERT INTO test_chess_games (id, game) VALUES (8, '1. d4 Nf6 2. c4 e6 3. Nc3 Bb4 4. a3 Bxc3+ 5. bxc3 d6 6. f3 O-O 7. e4 e5 8. Bd3 Nc6 9. Be3 Re8 10. Ne2 b6 11. g4 Na5 12. Ng3 Ba6 13. Qe2 Nd7 14. h4 Nf8 15. f4 exf4 16. Bxf4 Qd7 17. O-O Qa4 18. Nf5 Bxc4 19. Bxc4 Qxc4 20. Qf3 Qe6 21. Rae1 Nc4 22. d5 Qd7 23. Nxg7 Kxg7 24. Bh6+ Kxh6 25. Qf6+ Ng6 26. Rf5 Re5 27. Re2 Rg8 28. Rh5+ Rxh5 29. g5+ Rxg5+ 30. hxg5+ Kh5 31. Rh2+ Kg4 32. Rg2+ 1-0');
INSERT INTO test_chess_games (id, game) VALUES (9, '1. e4 e5 2. Nf3 Nc6 3. Bc4 Nf6 4. d4 exd4 5. O-O Bc5 6. e5 d5 7. exf6 dxc4 8. Re1+ Be6 9. Ng5 Qd5 10. Nc3 Qf5 11. Nce4 Bb6 12. fxg7 Rg8 13. g4 Qg6 14. Nxe6 fxe6 15. Bg5 Rxg7 16. Nf6+ Kf8 17. Qf3 Rf7 18. Rxe6 Qxg5 19. Nxh7+ Kg7 20. Qxf7+ Kxf7 21. Nxg5+ Kg7 22. h4 Rf8 23. Rxc6 1-0');
INSERT INTO test_chess_games (id, game) VALUES (10,'1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 Nc6 6. Bg5 e6 7. Qd2 Be7 8. O-O-O O-O 9. Nb3 Qb6 10. f3 Rd8 11. h4 d5 12. Bxf6 Bxf6 13. exd5 Bxc3 14. Qxc3 exd5 15. Qc5 Qc7 16. Bb5 Bf5 17. Bxc6 bxc6 18. g4 Be6 19. Nd4 Bd7 20. h5 Qb6 21. Nb3 Qxc5 22. Nxc5 h6 23. Rhe1 Kf8 24. Rd3 Be8 25. Rd4 Rdc8 26. Rf4 a5 27. Re3 Rab8 28. Ra3 Rb5 29. Ne6+ Kg8 30. Nd4 Rb4 31. Rxa5 c5 32. Ne2 d4 33. Rf5 Rcb8 34. b3 c4 35. a3 R4b6 36. Nxd4 cxb3 37. cxb3 Bd7 38. Rf4 Rd6 39. b4 Rd8 40. Kc2 1-0');

SELECT count(*)
FROM test_chess_games
WHERE has_board(game,
'rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2', 2);
-- Expected Result : '5'


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


-- additional but messy!


create extension chess_type_extension;

create extension chess;

--  Table for testing
CREATE TABLE test_chess_games (
    id serial PRIMARY KEY,
    game SAN
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
    '1. Nf2 Nf6 2. c4'
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

SELECT get_FirstMoves(game, 2) FROM test_chess_games WHERE id = 1;

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

SELECT get_FirstMoves('2. e4 e5 3. Nf3 Nc6 {A comment} 4. Bb5 a6 (A annotation)', 3);
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


-- testin the get board function --

create extension chess;

--  Table for testing
CREATE TABLE favorite_games (
    id serial PRIMARY KEY,
    game_notation SAN
);

select  * from favorite_games;

INSERT INTO favoriteGames (game) VALUES (' 1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. Nf3 Nf6 2. b3 g6 3. Bb2 Bg7 4. g3 d6 5. Bg2 O-O 6. O-O c6 7. d3 e5 8. c4 Ne8 9. Nbd2 f5 10. Qc2 Na6 11. c5 Nxc5 12. Nxe5 Qe7 13. d4 Na6 14. Qc4+ Kh8 15. Nef3 Be6 16. Qc3 f4 17. gxf4 Rxf4 18. Qe3 Rf8 19. Ng5 Nec7 20. Nc4 Rae8 21. Nxe6 Qxe6 22. Qxe6 Rxe6 23. e3 d5 24. Ne5 g5 25. Ba3 Rff6 26. Bh3 Re8 27. Bd7 Rd8 28. Be7 Rxd7 29. Bxf6 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. d4 Nf6 2. Nf3 g6 3. Bf4 Bg7 4. e3 d6 5. h3 O-O 6. Nbd2 Nbd7 7. Bc4 c6 8. a4 Re8 9. O-O e5 10. Bh2 e4 11. Ne1 Nf8 12. Qe2 a5 13. c3 b6 14. b4 axb4 15. cxb4 d5 16. Bb3 Ba6 17. Qd1 Bxf1 0-1');
INSERT INTO favoriteGames (game) VALUES ('1. e4 c5 2. Nf3 e6 3. d4 cxd4 4. Nxd4 Nf6 5. Bd3 Nc6 6. Nxc6 bxc6 7. O-O d5 8. exd5 cxd5 9. Qf3 Bd6 10. Bg5 Be7 11. Nd2 O-O 12. c4 Bb7 13. Bc2 Qb6 14. Qd3 dxc4 15. Qh3 g6 16. Nxc4 Qc6 17. Ne3 Nd5 18. Bxe7 Nxe7 19. Rac1 Qb5 20. Qh4 Nd5 21. Ba4 Qb6 22. Ng4 h5 23. Ne5 Qd6 24. Qg5 Kg7 25. Rfd1 Qd8 26. Qg3 Rh8 27. h4 Qf6 28. Rc4 Rac8 29. Rcd4 Qf5 30. Nc4 Rb8 31. R1d3 Nf6 32. Nd6 Qa5 33. f3 Ba6 34. Rd2 Rb4 35. Bb3 Rxd4 36. Rxd4 Qc5 37. Qf2 Qc1+ 38. Kh2 Qc7 39. Qg3 Qc5 40. Rd2 Qe3 41. Qg5 Qe1 42. Rd1 Qe2 43. Rd2 1/2-1/2');
INSERT INTO favoriteGames (game) VALUES ('1. e4 e5 2. f4 exf4 3. Nf3 g5 4. Bc4 g4 5. Nc3 gxf3 6. O-O d6 7. Qxf3 c6 8. d4 Bh6 9. Bxf7+ Kxf7 10. Qh5+ Kg7 11. Bxf4 Bxf4 12. Rxf4 Nf6 13. Qg5+ Kf7 14. e5 dxe5 15. dxe5 Nd7 16. Ne4 Rg8 17. Qh5+ Kg7 18. exf6+ Kh8 19. Rh4 Nf8 20. Ng5 Rxg5 21. Qxg5 Ne6 22. Qh5 Qg8 23. f7 Qg7 24. Rg4 Qf8 25. Qe5+ Ng7 26. Rxg7 Qxg7 27. f8=Q+ 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. e4 e5 2. Nf3 Qf6 3. d4 exd4 4. Bg5 Qg6 5. Bd3 Bc5 6. O-O Ne7 7. Nbd2 O-O 8. Nb3 Bb4 9. a3 Bd6 10. e5 Qe6 11. Nbxd4 Qd5 12. exd6 cxd6 13. Bxe7 Re8 14. Nf5 Nc6 15. Nxd6 Rxe7 16. Bxh7+ Kf8 17. Qxd5 a6 18. Nh4 g6 19. Rae1 b5 20. Rxe7 Kg7 21. Qxf7+ Kh6 22. Qxg6+ 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 O-O 8. c3 d6 9. h3 Na5 10. Bc2 c5 11. d4 Qc7 12. Nbd2 Nc6 13. dxc5 dxc5 14. Nf1 Be6 15. Nh4 g6 16. Qf3 Kh8 17. Bg5 Ng8 18. Qg3 f5 19. f4 Bd6 20. exf5 Bxf5 21. Nxf5 exf4 22. Qf2 gxf5 23. Rad1 Rac8 24. Re6 Be5 25. Qxc5 Qg7 26. Bxf4 Bxf4 27. Rxc6 Bb8 28. Kh1 Ba7 29. Qd6 Bb8 30. Qe6 Rce8 31. Qd7 Re7 32. Qd4 Be5 33. Qd3 Nf6 34. Qxf5 Nd5 35. Rc8 Rf7 36. Rxf8+ Rxf8 37. Qe4 Nf4 38. Re1 Bd6 39. Qd4 Qxd4 40. cxd4 Ne2 41. Bd1 Bb4 42. Bxe2 Bxe1 43. Bf3 Rf4 44. d5 Ra4 45. a3 b4 46. axb4 Rxb4 47. d6 Rxb2 48. d7 Ba5 49. Ne3 Bc7 50. Kg1 a5 51. Bc6 Rb6 52. Ba4 Rb4 53. Bc6 Rd4 54. Nf5 Rc4 55. Bd5 Rc5 56. Be6 Re5 0-1');
INSERT INTO favoriteGames (game) VALUES ('1. d4 Nf6 2. c4 e6 3. Nc3 Bb4 4. a3 Bxc3+ 5. bxc3 d6 6. f3 O-O 7. e4 e5 8. Bd3 Nc6 9. Be3 Re8 10. Ne2 b6 11. g4 Na5 12. Ng3 Ba6 13. Qe2 Nd7 14. h4 Nf8 15. f4 exf4 16. Bxf4 Qd7 17. O-O Qa4 18. Nf5 Bxc4 19. Bxc4 Qxc4 20. Qf3 Qe6 21. Rae1 Nc4 22. d5 Qd7 23. Nxg7 Kxg7 24. Bh6+ Kxh6 25. Qf6+ Ng6 26. Rf5 Re5 27. Re2 Rg8 28. Rh5+ Rxh5 29. g5+ Rxg5+ 30. hxg5+ Kh5 31. Rh2+ Kg4 32. Rg2+ 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. e4 e5 2. Nf3 Nc6 3. Bc4 Nf6 4. d4 exd4 5. O-O Bc5 6. e5 d5 7. exf6 dxc4 8. Re1+ Be6 9. Ng5 Qd5 10. Nc3 Qf5 11. Nce4 Bb6 12. fxg7 Rg8 13. g4 Qg6 14. Nxe6 fxe6 15. Bg5 Rxg7 16. Nf6+ Kf8 17. Qf3 Rf7 18. Rxe6 Qxg5 19. Nxh7+ Kg7 20. Qxf7+ Kxf7 21. Nxg5+ Kg7 22. h4 Rf8 23. Rxc6 1-0');
INSERT INTO favoriteGames (game) VALUES ('1. e4 c5 2. Nf3 d6 3. d4 cxd4 4. Nxd4 Nf6 5. Nc3 Nc6 6. Bg5 e6 7. Qd2 Be7 8. O-O-O O-O 9. Nb3 Qb6 10. f3 Rd8 11. h4 d5 12. Bxf6 Bxf6 13. exd5 Bxc3 14. Qxc3 exd5 15. Qc5 Qc7 16. Bb5 Bf5 17. Bxc6 bxc6 18. g4 Be6 19. Nd4 Bd7 20. h5 Qb6 21. Nb3 Qxc5 22. Nxc5 h6 23. Rhe1 Kf8 24. Rd3 Be8 25. Rd4 Rdc8 26. Rf4 a5 27. Re3 Rab8 28. Ra3 Rb5 29. Ne6+ Kg8 30. Nd4 Rb4 31. Rxa5 c5 32. Ne2 d4 33. Rf5 Rcb8 34. b3 c4 35. a3 R4b6 36. Nxd4 cxb3 37. cxb3 Bd7 38. Rf4 Rd6 39. b4 Rd8 40. Kc2 1-0');


select * from  test_chess_games;

SELECT get_board_state('1. e4 e5 2. Nf3', 0);
SELECT get_board_state('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 ', 1);

select get_board_state(game, 2) FROM test_chess_games WHERE id = 1;

-- FEN notation --

CREATE TABLE test_chess_board (
    id serial PRIMARY KEY,
    gameboard FEN
);

INSERT INTO test_chess_board (gameboard) VALUES ('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1');

INSERT INTO test_chess_board (gameboard) VALUES ('rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2');

SELECT * FROM test_chess_board;


--- test has board function --

SELECT has_board('1. e4 e5 2. Nf3 Nc6', 'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2', 4);

create extension chess;

select  get_firstmoves('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0', 10);

SELECT get_board_state('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0', 10);


SELECT has_board('Invalid SAN string', 'invalid FEN string', 5);

SELECT has_board('1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Bc5 6. O-O d6 7. d4 exd4 8. cxd4 Bb6 9. Nc3 Na5 10. Bd3 Ne7 11. e5 dxe5 12. dxe5 O-O 13. Qc2 h6 14. Ba3 c5 15. Rad1 Bd7 16. e6 fxe6 17. Bh7+ Kh8 18. Ne5 Nd5 19. Nxd5 exd5 20. Rxd5 Bf5 21. Rxd8 Bxc2 22. Rxf8+ Rxf8 23. Bxc2 1-0', 'r1bqk1nr/pppp1ppp/2n5/2b1p3/2B1P3/2P2N2/P2P1PPP/RNBQK2R w KQkq -', 10);


SELECT count(*)
FROM test_chess_games
WHERE has_board(game,
'r1bqkbnr/pppp1ppp/2n5/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 ', 10);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INDEXES
create extension chess;

CREATE TABLE chess_games (
    id serial PRIMARY KEY,
    game_notation SAN
);

select * from chess_games;

CREATE INDEX game_notation_idx ON chess_games using btree(game_notation);

CREATE INDEX game_notation_idx ON chess_games(game_notation)
WHERE game_notation LIKE '1. Nf3%';


EXPLAIN analyze SELECT * FROM chess_games WHERE game_notation LIKE '1. Nf3%';


explain analyze SELECT count(*) FROM chess_games WHERE has_opening(game_notation, '1. c4 2. exd5'::san);

explain analyze SELECT * FROM chess_games where game_notation LIKE 'e4 e5%';

SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT * FROM chess_games WHERE game_notation = 'e4 e5 Nf3 Nc6 Bb5';
SET enable_seqscan = ON;

SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT count(*)
FROM chess_games
WHERE has_opening(game_notation, '1. c4 2. exd5');
SET enable_seqscan = ON;

SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT * FROM chess_games WHERE has_opening(game_notation, 'e4 e5 Nf3') ORDER BY game_notation LIMIT 10;
SET enable_seqscan = ON;

-- Specific Opening Move Query test
EXPLAIN ANALYZE
SELECT * FROM chess_games
WHERE has_opening(game_notation, '1. e4 c5 2. Nf3 d6');
-- Activates seq scan with result :
/*
    Seq Scan on chess_games  (cost=0.00..3980.19 rows=8538 width=1004) (actual time=5.056..5.056 rows=0 loops=1)
    "  Filter: has_opening(game_notation, '1. e4 c5 2. Nf3 d6'::san)"
    Rows Removed by Filter: 25617
    Planning Time: 0.039 ms
    Execution Time: 5.068 ms
*/


-- Limited Range Query test
EXPLAIN ANALYZE
SELECT * FROM chess_games
WHERE has_opening(game_notation, '1. d4 d5')
LIMIT 100;
-- Activates seq scan With results :
/*

    Limit  (cost=0.00..46.62 rows=100 width=1004) (actual time=4.583..4.584 rows=0 loops=1)
    ->  Seq Scan on chess_games  (cost=0.00..3980.19 rows=8538 width=1004) (actual time=4.582..4.582 rows=0 loops=1)
    "        Filter: has_opening(game_notation, '1. d4 d5'::san)"
            Rows Removed by Filter: 25617
    Planning Time: 0.037 ms
    Execution Time: 4.593 ms
*/


-- Ordered Query test
EXPLAIN ANALYZE
SELECT * FROM chess_games
WHERE has_opening(game_notation, '1. c4 e6')
ORDER BY game_notation
LIMIT 50;
-- Activates index scan with results :
/*
    Limit  (cost=0.79..192.11 rows=50 width=1004) (actual time=23.219..23.219 rows=0 loops=1)
      ->  Index Scan using game_notation_idx on chess_games  (cost=0.79..32671.00 rows=8538 width=1004) (actual time=23.216..23.216 rows=0 loops=1)
    "        Filter: has_opening(game_notation, '1. c4 e6'::san)"
            Rows Removed by Filter: 25617
    Planning Time: 0.185 ms
    Execution Time: 23.254 ms
*/


-- Aggregate Queries test
-- need to turn off the seq scan to trigger the index scan
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT COUNT(*)
FROM chess_games
WHERE has_opening(game_notation, '1. f4 e5');
SET enable_seqscan = on;

-- Partial Index Query test
EXPLAIN ANALYZE
SELECT * FROM chess_games
WHERE game_notation LIKE '1. Nf3%'
  AND has_opening(game_notation, '1. Nf3 d5');

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT count(*)
FROM chess_games
WHERE has_opening(game_notation, '1. e4 e5 2. Nf3 Nf6 3. d3');
SET enable_seqscan = ON;


SELECT * FROM chess_games WHERE game_notation ~~ 'e4%';
SELECT * FROM chess_games WHERE game_notation ~~ '1. d4 d5%';

SELECT * FROM chess_games WHERE game_notation !~~ 'e4%';

SELECT * FROM chess_games WHERE game_notation !~~ '%Bb5%';

SELECT san_not_like('e4 e5 Nf3 Nc6 Bb5 a6 Ba4 Nf6 O-O Be7 Re1 b5 Bb3 d6 c3 O-O h3 Nb8'::SAN, 'e4%');

SET enable_seqscan = off;
explain analyze SELECT g.game_notation
FROM chess_games g, favorite_games f
WHERE has_opening(g.game_notation, get_firstmoves(f.game_notation, 10));
SET enable_seqscan = on;


explain analyze SELECT * FROM chess_games WHERE game_notation = 'e4';

ANALYZE chess_games;

CREATE INDEX idx_opening_expression ON chess_games USING btree (has_opening);


SELECT count(*)
FROM chess_games
WHERE has_board(game_notation, 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1', 3);

explain  analyze
SELECT count(*)
FROM chess_games
WHERE has_opening(game_notation, '1. e4 e5 2. Nf3 Nf6 3. d3');







----------------------------------------------------More tests----------------------------------------------------------

create extension chess;


CREATE TABLE chess_games (
    id serial PRIMARY KEY,
    game_notation SAN
);

CREATE INDEX idx_chessgame_board_states ON favoriteGames USING gin (game);

select * from chess_games;

CREATE INDEX game_notation_idx ON chess_games using btree(game_notation) where has_opening(game_notation, '1. c4 c5 2. c3 3. c3 4. Re1 5. a3 6. c3 7. a3 8. Bxf6');

SET enable_seqscan = off;
explain  analyze
SELECT count(*)
FROM chess_games
WHERE has_opening(game_notation, '1. c4 c5 2. c3 3. c3 4. Re1 5. a3 6. c3 7. a3 8. Bxf6');
SET enable_seqscan = on;


VACUUM ANALYZE favoriteGames;

VACUUM FULL favoriteGames;

LOAD 'pg_hint_plan';


/*+ IndexScan(favoriteGames idx_chessgame_board_states) */
EXPLAIN ANALYZE
SELECT * FROM favoriteGames WHERE has_board(game, 'r1br2k1/pp2bppp/1qnppn2/6B1/4P3/1NN2P2/PPPQ2PP/2KR1B1R w - - 1 11', 3);

/*+ SeqScan(favoriteGames) IndexScan(favoriteGames idx_chessgame_board_states) */

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT count(*)
FROM favoriteGames
WHERE has_board(game, 'r1br2k1/pp2bppp/1qnppn2/6B1/4P3/1NN2P2/PPPQ2PP/2KR1B1R w - - 1 11', 5)
group by game
order by game;

VACUUM ANALYZE favoriteGames;



ANALYZE favorite_games;

EXPLAIN analyze SELECT * FROM favorite_games
WHERE game @> 'r1br2k1/pp2bppp/1qnppn2/6B1/4P3/1NN2P2/PPPQ2PP/2KR1B1R w - - 1 11'::fen;

EXPLAIN analyze SELECT * FROM favorite_games
WHERE game = 'r1br2k1/pp2bppp/1qnppn2/6B1/4P3/1NN2P2/PPPQ2PP/2KR1B1R w - - 1 11'::fen;



select get_board_state('1. d4 Nf6 2. Nf3 g6 3. Bf4 Bg7 4. e3 d6 5. h3 O-O 6. Nbd2 Nbd7 7. Bc4 c6 8. a4 Re8 9. O-O e5 10. Bh2 e4 11. Ne1 Nf8 12. Qe2 a5 13. c3 b6 14. b4 axb4 15. cxb4 d5 16. Bb3 Ba6 17. Qd1 Bxf1 0-1', 10)

