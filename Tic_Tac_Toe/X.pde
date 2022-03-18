class X extends Object{
   X(PVector p){
      super(p); 
   }
   void display(PVector size){
     pushMatrix();
     
     stroke(this.col);
     strokeWeight(this.lineThickness);
     line(this.pos.x, this.pos.y,
          this.pos.x + size.x, this.pos.y + size.y);
     line(this.pos.x + size.x, this.pos.y,
          this.pos.x, this.pos.y + size.y);
     
     popMatrix();
   }
}
