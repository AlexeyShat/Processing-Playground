int minR = 5; //5
float scl = 2; //2

void setup() {
  size(1200, 900);
  colorMode(HSB);
}

void draw() {
  background(51);
  drawFractal(width / 2, height / 2, 600, 0);
  noLoop();
}

void drawFractal(float x, float y, float r, int deep) {
  fill((deep * 100) % 255, 255, 255);
  noStroke();
  ellipse(x, y, r, r);
  if (r > minR) {
    float newR = r / scl;
    drawFractal(x - newR, y, newR, deep + 1);
    drawFractal(x + newR, y, newR, deep + 1);
    drawFractal(x, y + newR, newR, deep + 1);
    drawFractal(x, y - newR, newR, deep + 1);
  }
}
