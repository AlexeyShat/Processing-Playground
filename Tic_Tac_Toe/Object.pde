abstract class Object{
  PVector pos;
  color col;
  int lineThickness;
  
  Object(PVector p){
     this.pos = p;
     this.col = color(0, 0, 0);
     this.lineThickness = 1;
  }
  void setColor(color c){
      this.col = c;
  }
  void setLineThickness(int t){
     this.lineThickness = t; 
  }
  abstract void display(PVector areaSize);
}
