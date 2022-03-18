class Shape {
  ArrayList<Line> path;

  Shape(Line start) {
    path = new ArrayList<Line>();
    path.add(start);
  };

  void show() {
    for (Line l : this.path) {
      l.show();
    }
  }

  void nextGen() {
    ArrayList<Line> newPath = new ArrayList<Line>();

    for (Line l : path) {
      ArrayList<Line> tmp = l.generate();
      for (Line ll : tmp) {
        newPath.add(ll);
      }
    }

    this.path = newPath;
  }
}
