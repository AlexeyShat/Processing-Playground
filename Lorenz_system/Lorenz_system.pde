import peasy.*;

float p = 28,  //default = 28
  b = 8.0/3.0, //default = 8.0/3.0
  q = 10;      //default = 10
float x = 0.01, 
  y = 0, 
  z = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (q * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  scale(5);
  noFill();
  float c = 0;
  beginShape();
  for (PVector v : points) {
    stroke(c % 256, 255, 255);
    vertex(v.x, v.y, v.z);
    c += 0.1;
  }
  endShape();
}
