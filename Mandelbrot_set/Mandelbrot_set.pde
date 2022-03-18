float max_iterations = 1000;
float limit = 4;

void setup() {
  size(800, 500);
  //fullScreen();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      //z1 = z0^2 + c
      // z = c = a + b*i
      //z^2 = (a+bi)^2 = a*a+abi+abi-b*b
      float za = 0;
      float zb = 0;
      boolean flag = false;
      int iters = 0;
      while (iters < max_iterations && !flag) {
        float a = za * za - zb * zb;
        float b = 2 * za * zb;
        za = a + map(x - width/2, -width/2, width/2, -2, 1);
        zb = b + map(y - height/2, -height/2, height/2, -1, 1);
        if (za * za + zb * zb > limit * limit) {
          flag = true;
        }
        iters++;
      }
      int index = x + y * width;
      /*if (!flag) {
        pixels[index] = color(0);
      } else {
        pixels[index] = color(255);
      }*/
      pixels[index] = color(255*sin(1/iters), 255*cos(iters), 255 * sin(iters));
    }
  }
  updatePixels();
  noLoop();
}
