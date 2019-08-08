//please make this evenly divisible!!
int rows = 100;
int cols = 150;

//init
int cellW;
int cellH;
Cell[][] grid = new Cell[rows][cols];
float initFactor = .25;


void setup() {
  //set up screen
  //cannot be variables
  size(900, 600);

  int fr = 20;
  frameRate(fr);

  //calc cell size
  cellW = width / cols;
  cellH = height / rows;

  //initialize random starting grid
  initGrid();

  //set up drawing defaults
  strokeWeight(0);
  stroke(white);
}

void draw() {
  //reset  button
  if (keyPressed && key == 'r') {
    initGrid();
  }

  //calc neighbors first
  calcNeighbors();

  //apply game rules
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j].state == State.Alive) {
        if (grid[i][j].neighbors < 2 || grid[i][j].neighbors > 3) {
          grid[i][j].state = State.Dead;
          grid[i][j].decaying = true;
        }
      } else if (grid[i][j].state == State.Dead && grid[i][j].neighbors == 3) {
        grid[i][j].state = State.Alive;
        grid[i][j].decaying = false;
      } else {
        grid[i][j].decaying = false;
      }
    }
  }

  //draw grid
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {

      //determine background color
      if (grid[i][j].state == State.Alive) {
        fill(grey20);
      } else if (grid[i][j].decaying) {
        fill(grey70);
      } else {
        fill(white);
      }

      //draw rect
      rect(j * cellW, i * cellH, cellW, cellH);
    }
  }

  //do last
  frameCount();
}

enum State { 
  Dead, Alive
}

class Cell {
  State state;
  int neighbors;
  boolean decaying;
}

void initGrid() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      Cell c = new Cell();
      if (initFactor > random(1)) {
        c.state = State.Alive;
      } else {
        c.state = State.Dead;
      }
      grid[i][j] = c;
    }
  }
}

void calcNeighbors() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int count = 0;

      //top row
      if (i - 1 > 0) {
        //left
        if (j - 1 > 0 && grid[i - 1][j - 1].state  == State.Alive) {
          count++;
        }

        //center
        if (grid[i - 1][j].state  == State.Alive) {        
          count++;
        }

        //right
        if (j + 1 < cols && grid[i - 1][j + 1].state  == State.Alive) {        
          count++;
        }
      }

      //center left
      if (j - 1 > 0 && grid[i][j - 1].state == State.Alive) {
        count++;
      }

      //center right
      if (j + 1 < cols && grid[i][j + 1].state == State.Alive) {        
        count++;
      }

      //bottom row
      if (i + 1 < rows) {
        //left
        if (j - 1 > 0 && grid[i + 1][j - 1].state == State.Alive) {
          count++;
        }

        //center
        if (grid[i + 1][j].state == State.Alive) {        
          count++;
        }

        //right
        if (j + 1 < cols && grid[i + 1][j + 1].state == State.Alive) {        
          count++;
        }
      }

      //println("cell at " + i + " "  + j + " has " + count + " neighbors");
      grid[i][j].neighbors = count;
    }
  }
}
