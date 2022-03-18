import java.util.*;

class Spot {
  int i, j;
  List<Spot> neighbors = new ArrayList<Spot>();
  boolean wall = false;
  List<Spot> shortestPath = new LinkedList<Spot>();
  Integer distance = Integer.MAX_VALUE;

  Spot(int i_, int j_) {
    i = i_;
    j = j_;
    wall = false;
    if (random(1) < 0.4) {
      wall = true;
    }
  }
  
  Spot(int i_, int j_, boolean wall_) {
    i = i_;
    j = j_;
    wall = wall_;
  }

  void show() {
    if (wall) {
      fill(0);
      noStroke();
      ellipse(i * w + w / 2.0, j * h + h / 2.0, w / 2.0, h / 2.0);
    }
  }

  void addNeighbors(Spot[][] grid) {
    if (i < cols - 1) {
      neighbors.add(grid[i+1][j]);
    }
    if (i > 0) {
      neighbors.add(grid[i-1][j]);
    }
    if (j < rows - 1) {
      neighbors.add(grid[i][j+1]);
    }
    if (j > 0) {
      neighbors.add(grid[i][j-1]);
    }
    if (i > 0 && j > 0) {
      neighbors.add(grid[i-1][j-1]);
    }
    if (i < cols - 1 && j > 0) {
      neighbors.add(grid[i+1][j-1]);
    }
    if (i > 0 && j < rows - 1) {
      neighbors.add(grid[i-1][j+1]);
    }
    if (i < cols - 1 && j < rows - 1) {
      neighbors.add(grid[i+1][j+1]);
    }
  }
}
