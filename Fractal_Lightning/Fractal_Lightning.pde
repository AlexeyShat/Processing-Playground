Shape sh;
Line start;

void setup(){
  size(800, 800);
  
  PVector v1 = new PVector(200, 400);
  PVector v2 = new PVector(600, 400);
  start = new Line(v1, v2);
  sh = new Shape(start);
}

void draw(){
  background(0);
  sh.show();
}

void mousePressed(){
   sh.nextGen(); 
}
