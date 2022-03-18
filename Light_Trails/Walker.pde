class Walker {
  PVector pos;
  PVector vel;
  color col;
  float r;
  float turnA;
  int trailSize;
  ArrayList<PVector> trail;

  boolean flag;

  Walker(PVector start, color c) {
    pos = start;
    vel = new PVector(floor(random(5, 15)), 0);//5
    col = c;
    r = 16;
    turnA = PI / 30;
    trailSize = 70;
    trail = new ArrayList<PVector>();
    flag = true;
  }

  void update() {
    trail.add(pos.copy());
    pos.add(vel);
    if ( trail.size() > trailSize) {
      trail.remove(0);
    }
  }

  void edges() {
    if (pos.x < 0) pos.x = width;
    if (pos.x > width) pos.x = 0;
    if (pos.y < 0) pos.y = height;
    if (pos.y > height) pos.y = 0;
  }

  void controlsRndA() {
    float rnd = random(1);
    float curAng = vel.heading();
    float mag = vel.mag();
    if (rnd < 0.33) curAng -= turnA;
    else {
      if (rnd < 0.66) curAng += turnA;
    }
    vel = PVector.fromAngle(curAng);
    vel.setMag(mag);
  }

  void controlsRndD() {
    float rnd = random(1);
    float curAng = vel.heading();
    float mag = vel.mag();
    if (rnd < 0.015) curAng -= PI/2;
    else {
      if (rnd < 0.03) curAng += PI/2;
    }
    vel = PVector.fromAngle(curAng);
    vel.setMag(mag);
  }

  void controlsAnalog() {
    if (keyPressed) {
      float curAng = vel.heading();
      float mag = vel.mag();
      switch(key) {
      case 'a':
        curAng -= turnA;
        break;
      case 'd':
        curAng += turnA;
        break;
      }
      vel = PVector.fromAngle(curAng);
      vel.setMag(mag);
    }
  }

  void controlsDiscret() {
    if (keyPressed) {
      if (this.flag) {
        float curAng = vel.heading();
        float mag = vel.mag();
        switch(key) {
        case 'a':
          curAng -= PI/2;
          break;
        case 'd':
          curAng += PI/2;
          break;
        }
        vel = PVector.fromAngle(curAng);
        vel.setMag(mag);
      }
      this.flag = false;
    } else {
      this.flag = true;
    }
  }

  void show() {
    pushMatrix();
    strokeWeight(4);
    stroke(this.col);
    noFill();
    beginShape();
    int len = trail.size();
    for (int i = len - 1; i > 0; i--) {
      PVector dot = trail.get(i);
      PVector dot2 = trail.get(i-1);
      vertex(dot.x, dot.y);
      if (dot.dist(dot2) > 2 * vel.mag()) {
        endShape();
        beginShape();
      }
    }
    endShape();
    fill(this.col);
    noStroke();
    float ang = vel.heading();
    translate(pos.x, pos.y);
    rotate(ang);
    rotate(PI/2);
    triangle(-this.r/2, this.r, 0, -this.r, this.r/2, this.r);
    popMatrix();
  }
}
