int arr[][];
float maxD;
void setup(){
  //size(600,600);
  fullScreen();
  
  colorMode(HSB);
  maxD = sqrt(width * width + height * height);
  
  arr = new int[width][height];
  for (int i = 0; i<width;i++){
   for (int j = 0;j<height;j++){
     arr[i][j] = 0;
   }
  }
}

void draw(){
  background(0);
  loadPixels();
  for (int i = 0; i < width; i++){
   for (int j = 0; j < height; j++){
     int index = i + j * width;
     if (!isprime(i&j)){
       float dist = dist(i, j, 0, 0);
       float hue = map(dist, 0, maxD, 0, 255);
       pixels[index] = color(hue, 255, 255);
     }
   }
  }
  updatePixels();
  noLoop();
}

boolean isprime(int a){
  for (int i = 2; i <= sqrt(a); i++) {
    if (a % i == 0) {
      return false;
    }
  }
  return true;
  
}
