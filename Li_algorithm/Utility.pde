import java.util.*;

ArrayList<Spot> find_path(Spot[][] grid, Spot start, Spot end){
  
   ArrayList<Spot> current = new ArrayList<Spot>();
   current.add(start);
   int value = 0;
   
   //Calculate values on grid
   while (current.size() > 0){
      ArrayList<Spot> next = new ArrayList<Spot>();
      for (Spot spot : current){
         spot.value = value;
      }
      for (Spot spot : current){
         List<Spot> neighbors = spot.neighbors;
         for (Spot n : neighbors){
            if (n.value == -1 && !n.wall && !next.contains(n)){
                next.add(n);
            }
         } 
      }
      current = new ArrayList<Spot>(next);
      value++;
   }
   
   if (end.value == -1){
     return null; 
   }
   
   ArrayList<Spot> path = new ArrayList<Spot>();
   Spot cur_spot = end;
   path.add(cur_spot);
   
   while (cur_spot != start){
       List<Spot> neighbors = cur_spot.neighbors;
       for (Spot n : neighbors){
          if (!n.wall && n.value < cur_spot.value){
              cur_spot = n;
          }
       }
       path.add(cur_spot);
   }
   return path;
}
