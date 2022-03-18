class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxvel = 8;
  float h = 0;

  PVector prev;

  Particle() {
    pos = new PVector(random(width), random(height));
    prev = pos.copy();
    vel = PVector.random2D();//new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxvel);
    prev = pos.copy();
    pos.add(vel);
    acc.mult(0);
    h++;
  }

  void edges() {
    if (pos.x < 0) {
      pos.x = width;
      prev = pos.copy();
    }
    if (pos.x > width) {
      pos.x = 0;
      prev = pos.copy();
    }
    if (pos.y < 0) {
      pos.y = height;
      prev = pos.copy();
    }
    if (pos.y > height) {
      pos.y = 0;
      prev = pos.copy();
    }
  }

  void show() {
    stroke(h % 256, 255, 255, 2);
    strokeWeight(0.8);
    line(pos.x, pos.y, prev.x, prev.y);
  }
}
