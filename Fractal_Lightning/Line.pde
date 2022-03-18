class Line {
  PVector p1, p2;

  Line(PVector p1, PVector p2) {
    this.p1 = p1.copy();
    this.p2 = p2.copy();
  }

  void show() {
    stroke(255);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  ArrayList<Line> generate() {
    ArrayList<Line> newP = new ArrayList<Line>();

    float dX = p2.x - p1.x;
    float dY = p2.y - p1.y;
    PVector p3;
    if (dY == 0) {
      p3 = new PVector(p1.x + dX / 2, p1.y);
    } else if (dX == 0) {
      p3 = new PVector(p1.x, p1.y + dY / 2);
    } else {
      p3 = new PVector(p1.x + dX / 2, p1.y + dY / 2);
    }

    PVector tmp = p3.copy().sub(p1);
    float phi = PVector.angleBetween(tmp, new PVector());
    tmp.rotate(PI/4 + phi);
    float len = tmp.mag() / sin(PI/4);
    tmp.setMag(len);
    PVector p4 = p1.copy().add(tmp);
    
    newP.add(new Line(p1, p3));
    newP.add(new Line(p3, p4));
    newP.add(new Line(p4, p2));

    return newP;
  }
}
