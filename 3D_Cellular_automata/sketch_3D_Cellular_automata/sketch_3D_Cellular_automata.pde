import peasy.*;
PeasyCam cam;

int borderSize = 420;
int cellSize = 20;
int wInCells = borderSize / cellSize; //should be ODD number

int[][][] grid = new int[wInCells][wInCells][wInCells];
int[][][] tmpgrid = new int[wInCells][wInCells][wInCells];

int[] rules = {5, 5, 7, 15};

void setup(){
  size(800,800,P3D);
  cam = new PeasyCam(this, 650);
  
  //Initializing grid
  initGrid(0.2);
}

void draw(){
 background(51);
 
 //Draw field border
 showBorder();
 
 //Drawing grid
 showGrid();
  
 //Generating new grid state
 applyRules();
 
 println("Step");
}

void showBorder(){
    pushMatrix();
    noFill();
    stroke(0, 255, 0);
    box(borderSize);
    popMatrix();
}

void showBox(int i, int j, int k){
    pushMatrix();
    stroke(0);
    fill(255, 150);
    translate(i * cellSize, j * cellSize, k * cellSize);
    box(cellSize);
    popMatrix();
}

void showGrid(){
 int center = floor(wInCells / 2);
 for (int i = -center; i <= center; i++){
    for (int j = -center; j <= center; j++){
      for (int k = -center; k <= center; k++){
        int x = center + i;
        int y = center + j;
        int z = center + k;
        if (grid[x][y][z] == 1){
          showBox(i, j, k);
        }
      }
    }
  }
}

void initGrid(float p){
  for (int i = 0; i < wInCells; i++){
    for (int j = 0; j < wInCells; j++){
      for (int k = 0; k < wInCells; k++){
        if (random(1) < p) grid[i][j][k] = 1;
        else grid[i][j][k] = 0;
      }
    }
  }
}

int countNeighbours(int i, int j, int k){
  int counter = 0;
  for (int dx = -1; dx <= 1; dx++){ 
    int ni = i + dx;
    if (ni >= 0 && ni < wInCells){
      for (int dy = -1; dy <= 1; dy++){
        int nj = j + dy;
        if (nj >= 0 && nj < wInCells){
          for (int dz = -1; dz <= 1; dz++){
            int nk = k + dz;
            if (nk >= 0 && nk < wInCells){
              counter += grid[ni][nj][nk];
            }
          }
        }
      }
    }
  }
        
  return counter;
}

void applyRules(){
   for (int i = 0; i < wInCells; i++) {
    for (int j = 0; j < wInCells; j++) {
      for (int k = 0; k < wInCells; k++) {
        int nbCount = countNeighbours(i, j, k);
        
        if (rules[0] <= nbCount && nbCount <= rules[1]){
          tmpgrid[i][j][k] = 1;
        } else {
          if (rules[2] <= nbCount && nbCount <= rules[3]){
            tmpgrid[i][j][k] = 0; 
          } else {
            tmpgrid[i][j][k] = grid[i][j][k]; 
          }
        }
      }
    }
  }
  copyGrid(grid, tmpgrid);
}

void copyGrid(int[][][] dest, int[][][] source){
  for (int i = 0; i < wInCells; i++) {
    for (int j = 0; j < wInCells; j++) {
      for (int k = 0; k < wInCells; k++) {
        dest[i][j][k] = source[i][j][k];
      }
    }
  }
}
