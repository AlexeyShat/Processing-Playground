import java.util.*;

Integer[] lines;

int si = 0, sk = 1;

void setup(){
  size(800, 600);
  colorMode(HSB);
  
  //Generating array
  float lineK = (float) height / (float) width;
  lines = new Integer[width];
  for (int x = 0; x < width; x++){
    lines[x] = floor(lineK * x);
  }
  
  //Shuffling array
  List<Integer> tmp = Arrays.asList(lines);
  Collections.shuffle(tmp);
  lines = tmp.toArray(new Integer[0]);
}

void draw(){
   background(0);
   for (int i = 0; i < width; i++){
     int y = lines[i];
     float c = map(y, 0, height, 0, 255);
     stroke(c, 255, 255);
     line(i, height, i, height - y);
   }
   
   //Buble sort
   for(int count = 0 ; count < 700; count++){
     if (si == width - 2) {
       break;
     }
     else{
       if (sk == width) {
         si++;
         sk = si+1;
       }
       if (lines[sk] < lines[si]) {
         int z = lines[sk];
         lines[sk] = lines[si];
         lines[si] = z;
       }
       sk++;
     }
   }
}
