PVector center;
int circDots;
int otherDots;
float R;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  center = new PVector();
  R = 800;
  background(0);
}

void draw() {
  circDots = 0;
  otherDots = 0;
  translate(width/2, (height-100)/2);
  stroke(255);
  noFill();
  strokeWeight(4);
  rect(0, 0, R, R);
  ellipse(0, 0, R, R);

  for (int i = 0; i < 250; i++) {
    float x = random(-R/2, R/2);
    float y = random(-R/2, R/2);
    PVector p = new PVector(x, y);
    if (p.dist(center) > R/2) {
      stroke(0, 0, 255);
      otherDots++;
    } else {
      stroke(0, 255, 0);
      circDots++;
    }
    point(p.x, p.y);
  }

  float pi = 4 * (float)circDots / (otherDots + circDots);
  println("PI = " + nf(pi, 1, 10));
}
