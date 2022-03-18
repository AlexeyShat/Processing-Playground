float w = 40;
float h = 40;
int cols;
int rows;

float zoff = 0;

PVector[][] grid;
  Particle[] particles = new Particle[1000];

void setup() {
  //size(1200, 800);
  fullScreen();
  colorMode(HSB);
  cols = int(width / w);
  rows = int(height / h);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void draw() {


  grid = new PVector[cols][rows];
  float xoff = 0;
  for (int y = 0; y < rows; y++) {
    float yoff = 0;
    for (int x = 0; x < cols; x++) {
      float ang = noise(xoff, yoff, zoff) * TWO_PI;
      grid[x][y] = PVector.fromAngle(ang);
      yoff += 0.1;
    }
    xoff += 0.1;
  }

  for (Particle p : particles) {
    p.update();
    p.edges();
    p.show();
    int x = floor(cols * p.pos.x / (width+1));
    int y = floor(rows * p.pos.y / (height+1));
    PVector force = grid[x][y];
    p.applyForce(force);
  }
  
  //stroke(0, 100);
  //noFill();
  //for (int y = 0; y < rows; y++) {
  //  for (int x = 0; x < cols; x++) {
  //    //strokeWeight(1);
  //    //rect(x*w, y*h, w, h);
  //    pushMatrix();
  //    translate(x*w+w/2, y*h+h/2);
  //    rotate(grid[x][y].heading());
  //    strokeWeight(2);
  //    line(0, 0, w/2, 0);
  //    popMatrix();
  //  }
  //}
  zoff += 0.008;
}
