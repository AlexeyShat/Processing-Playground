class HexGrid {
  PVector[][] grid;
  float r;

  HexGrid(float r) {
    this.r = r;
    
    //Initializing size
    float w = 0.87 * r;
    float h = 2 * r;
    int rows = round(height / (0.78*h)); //?
    int cols = round(width / (2 * w));
    grid = new PVector[rows][];
    for (int i = 0; i < grid.length; i++) {
      if (i % 2 == 0) {
        grid[i] = new PVector[cols];
      } else {
        grid[i] = new PVector[cols - 1];
      }
    }
    
    //Creating grid
    float x = w, y = r;
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j] = new PVector(x, y);
        x += (2 * w);
      }
      y += 1.5 * r;
      if (i % 2 == 0) {
        x = 2 * w;
      } else {
        x = w;
      }
    }
  }

  void show() {
    stroke(0);
    fill(255);
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        pushMatrix();
        translate(grid[i][j].x, grid[i][j].y);
        beginShape();
        for (float angle = 0; angle < 2*PI; angle+=PI/3) {
          vertex(r * sin(angle), r * cos(angle));
        }
        endShape();
        popMatrix();
      }
    }
  }
}
