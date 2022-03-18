class Circle {
  PVector pos;
  float d;
  float speed;
  boolean stuck;
  color col;

  Circle(float x, float y) {
    this.pos = new PVector(x, y);
    this.d = 1;
    this.speed = 5;
    this.stuck = false;
    this.col = color(0);
  }
  Circle(float x, float y, color c) {
    this.pos = new PVector(x, y);
    this.d = 1;
    this.speed = 5;
    this.stuck = false;
    this.col = c;
  }

  void show() {
    //stroke(255);
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, d, d);
  }

  void grow() {
    if (!stuck) {
      d += speed / 2;
    }
  }

  void checkCollision(Circle other) {
    float dist = PVector.dist(pos, other.pos);
    boolean rule1 = (dist <= (d / 2 + other.d / 2));
    boolean rule2 = (pos.x - d / 2 <= 0);
    boolean rule3 = (pos.x + d / 2 >= width);
    boolean rule4 = (pos.y - d / 2 <= 0);
    boolean rule5 = (pos.y + d / 2 >= height);
    if (rule1 || rule2 || rule3 || rule4 || rule5) {
      stuck = true;
    }
  }
}
