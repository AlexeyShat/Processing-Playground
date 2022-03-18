Walker[] ws;
int number = 20;

void setup() {
  //size(800, 600);
  fullScreen();
  colorMode(HSB);
  ws = new Walker[number];
  for (int i = 0; i < number; i++) {
    color c = color(random(255), 255, 255);
    PVector start = new PVector(random(width), random(height));
    ws[i] = new Walker(start, c);
  }
}

void draw() {
  background(0);
  for (Walker w : ws) {
    w.show();
    w.update();
    //w.controlsAnalog();
    w.controlsDiscret();
    //w.controlsRndA();
    //w.controlsRndD();
    w.edges();
  }
}
