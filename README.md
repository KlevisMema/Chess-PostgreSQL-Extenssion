# Chess PostgreSQL Extension

## Overview
This PostgreSQL extension provides functionalities for storing and retrieving chess games in a PostgreSQL database. It uses Portable Game Notation (PGN) for recording full games, Standard Algebraic Notation (SAN) for moves, and Forsyth–Edwards Notation (FEN) for board states.

## Features
- Store and retrieve complete chess games in PGN format.
- Extract board state at any point in a game using SAN and FEN notations.
- Perform various chess-related queries and analyses directly within PostgreSQL.

## Prerequisites
- PostgreSQL (version 16.0 or above)
- Python (version 3.11)
- Python `chess` library

## Installation

### Step 1: Install Python Chess Library
Ensure Python 3 and pip are installed:
```bash
python3 --version
pip3 --version
