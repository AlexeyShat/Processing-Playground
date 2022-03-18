import java.util.*;

Spot getLowestDistanceNode(Set<Spot> unsettledSpots) {
    Spot lowestDistanceSpot = null;
    Integer lowestDistance = Integer.MAX_VALUE;
    for (Spot spot: unsettledSpots) {
        Integer spotDistance = spot.distance;
        if (spotDistance < lowestDistance) {
            lowestDistance = spotDistance;
            lowestDistanceSpot = spot;
        }
    }
    return lowestDistanceSpot;
}
void calculateMinimumDistance(Spot evaluationSpot, Integer edgeWeigh, Spot sourceSpot) {
    Integer sourceDistance = sourceSpot.distance;
    if (sourceDistance + edgeWeigh < evaluationSpot.distance) {
        evaluationSpot.distance = sourceDistance + edgeWeigh;
        LinkedList<Spot> shortestPath = new LinkedList<Spot>(sourceSpot.shortestPath);
        shortestPath.add(sourceSpot);
        evaluationSpot.shortestPath = shortestPath;
    }
}

List<Spot> find_path(Spot[][] grid, Spot start, Spot end){
  start.distance = 0;
  
  Set<Spot> settledSpots = new HashSet<Spot>();
  Set<Spot> unsettledSpots = new HashSet<Spot>();
  
  unsettledSpots.add(start);
  
  while (unsettledSpots.size() != 0) {
        Spot currentSpot = getLowestDistanceNode(unsettledSpots);
        unsettledSpots.remove(currentSpot);
        for (Spot adjacentSpot : currentSpot.neighbors) {
            int di = currentSpot.i - adjacentSpot.i;
            int dj = currentSpot.j - adjacentSpot.j;
            Integer edgeWeight = (di == 0 || dj == 0) ? 10 : 14;
            if (!settledSpots.contains(adjacentSpot) && !adjacentSpot.wall) {
                calculateMinimumDistance(adjacentSpot, edgeWeight, currentSpot);
                unsettledSpots.add(adjacentSpot);
            }
        }
        settledSpots.add(currentSpot);
    }
  
  List<Spot> path = end.shortestPath;
  if (path.size() > 0){
    path.add(end);
    return path;
  } else {
    return null; 
  }
}
