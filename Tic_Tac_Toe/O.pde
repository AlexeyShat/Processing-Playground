class O extends Object{
   O(PVector p){
      super(p); 
   }
   void display(PVector size){
     pushMatrix();
     
     noFill();
     stroke(this.col);
     strokeWeight(this.lineThickness);
     ellipse(this.pos.x + size.x/2, this.pos.y + size.y/2,
             size.x, size.y);
     
     popMatrix();
   }
}
