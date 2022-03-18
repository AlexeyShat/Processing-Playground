ArrayList<Circle> circles = new ArrayList<Circle>();

PImage img;

void setup() {
  //size(1121, 701); //Img1
  //img = loadImage("Images/Img2.jpg");
  size(1182, 665); //Img2
  img = loadImage("Images/Img2.jpg");
  img.loadPixels();

  float x = random(width);
  float y = random(height);
  int index = floor(x) + floor(y) * width;
  circles.add(new Circle(x, y, img.pixels[index]));
}

void draw() {
  background(0);
  //image(img, 0, 0);

  for (int i = 0; i < 20; i++) {
    Circle c;
    int count = 0;
    do {
      float x = random(width);
      float y = random(height);
      int index = floor(x) + floor(y) * width;
      c = new Circle(x, y, img.pixels[index]);
      for (int j = 0; j < circles.size(); j++) {
        Circle c2 = circles.get(j);
        c.checkCollision(c2);
      }
      count++;
    } while (c.stuck && count < 200);
    circles.add(c);
  }

  for (int i = 0; i < circles.size(); i++) {
    Circle current = circles.get(i);
    current.show();
    current.grow();
    if (!current.stuck) {
      for (int j = 0; j < circles.size(); j++) {
        if (i != j) {
          Circle c = circles.get(j);
          current.checkCollision(c);
        }
      }
    }
  }
  //println(frameRate);
}
void keyPressed() {
  if (key == ' ') {
    noLoop();
  }
}
