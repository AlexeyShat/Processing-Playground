float heuristic(Spot a, Spot b) {
  float d = dist(a.i, a.j, b.i, b.j);
  //float d = abs(a.i - b.i) + abs(a.j - b.j);
  return d;
}

List<Spot> find_path(Spot[][] grid, Spot start, Spot end){
 
  List<Spot> path = new ArrayList<Spot>();
  
  List<Spot> openSet = new ArrayList<Spot>();
  List<Spot> closedSet = new ArrayList<Spot>();
  
  Spot current = null;
  
  openSet.add(start);
  
  while (openSet.size() > 0) {
    int winner = 0;
    for (int i = 0; i < openSet.size(); ++i) {
      if (openSet.get(i).f < openSet.get(winner).f) {
        winner = i;
      }
    }
    current = openSet.get(winner);

    if (current == end) {
      break;
    }

    openSet.remove(current);
    closedSet.add(current);

    List<Spot> neighbors = current.neighbors;
    for (int i = 0; i < neighbors.size(); ++i) {
      Spot neighbor = neighbors.get(i);

      if (!closedSet.contains(neighbor) && !neighbor.wall) {
        float tempG = current.g + heuristic(neighbor, current);

        boolean newPath = false;
        if (openSet.contains(neighbor)) {
          if (tempG < neighbor.g) {
            neighbor.g = tempG;
            newPath = true;
          }
        } else {
          neighbor.g = tempG;
          newPath = true;
          openSet.add(neighbor);
        }

        if (newPath) {
          neighbor.heuristic = heuristic(neighbor, end);
          neighbor.f = neighbor.g + neighbor.heuristic;
          neighbor.previous = current;
        }
      }
    }
  }

  if (current != end){
    return null; 
  }
  Spot temp = current;
  path.add(temp);
  while (temp.previous != null) {
    path.add(temp.previous);
    temp = temp.previous;
  }
  
  return path;
}
