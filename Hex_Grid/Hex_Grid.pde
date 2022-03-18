HexGrid hg;

void setup() {
  size(800, 550);
  //fullScreen();
  hg = new HexGrid(20);
}

void draw() {
  background(100);
  
  hg.show();
  noLoop();
}
