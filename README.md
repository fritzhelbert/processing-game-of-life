## Processing - Conway's Game of Life
Implementation of Conway's Game of Life written in Processing.

## Description from Wikipedia
>The Game of Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970. The game is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input.

## Rules
1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

## Controls
Key | Function
--- | ---
[R] | Reseed

## Implementation Details
My implementation is based on an initial random seed with a 25% chance that any given cell is alive, from there it follows the standard rules. There is no screen wrap on the borders. Also of note, I added a 'decaying' state to aid in the visualization, which shows up as a ghosting effect the frame after a cell dies.

For performance reasons, I bumped the frame rate down to 20fps. Processing (at least on my laptop) can't get through the logic fast enough at the beginning to calculate every cell, so it lags. 20fps is a nice speed to watch the patterns form, so it works out.
