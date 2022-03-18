int cols;
int rows;
float w, h;
Spot start;
Spot end;
Spot[][] grid;

void setup(){
  size(800, 800);
  String[] source = loadStrings("grids/rand-grid.txt");
  
  //grid = initGrid(50, 50);
  grid = initGrid(source);
  //saveGrid(grid); //Save grid as .txt
  
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      grid[i][j].addNeighbors(grid);
    }
  }
}

void draw(){
  background(255);
  
  long startTime = System.nanoTime();
  List<Spot> path = find_path(grid, start, end); //Pathfinding
  long endTime = System.nanoTime();

  long dt = (endTime - startTime) / 1000;//000;
  println("Elapsed time = " + dt + " microseconds");
  
  if (path != null){
    noFill();
    stroke(0, 0, 255);
    strokeWeight(w/2);
    beginShape();
    for (int i = 0; i < path.size(); ++i) {
      vertex(path.get(i).i * w + w/2, path.get(i).j * h + h/2);
    }
    endShape();
    println("Path found");
  } else {
    println("No solution"); 
  }
  
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      grid[i][j].show();
    }
  }
  noLoop();
}

Spot[][] initGrid(String[] source){
  rows = source.length;
  cols = source[0].length();
  grid = new Spot[cols][rows];
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      char c = source[j].charAt(i);
      boolean wall = false;
      if (c == '#') wall = true;
      grid[i][j] = new Spot(i, j, wall);
      if (c == 's') start = grid[i][j];
      if (c == 'e') end = grid[i][j];
    }
  }
  w = float(width) / cols;
  h = float(height) / rows;
  return grid;
}

Spot[][] initGrid(int c_, int r_){
  cols = c_;
  rows = r_;
  grid = new Spot[cols][rows];
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      grid[i][j] = new Spot(i, j);
    }
  }
  w = float(width) / cols;
  h = float(height) / rows;
  start = grid[0][0];
  end = grid[cols-1][rows-1];
  start.wall = false;
  end.wall = false;
  return grid;
};

void saveGrid(Spot[][] grid){
  String[] lines = new String[rows];
  for (int j = 0; j < rows; ++j) {
    String line = "";
    for (int i = 0; i < cols; ++i) {
      Spot spot = grid[i][j];
      if (spot == start) line += 's';
      else if (spot == end) line += 'e';
           else if (spot.wall) line += '#';
                else line += '0';
    }
    lines[j] = line;
  }
  saveStrings("rand-grid.txt", lines);
}
