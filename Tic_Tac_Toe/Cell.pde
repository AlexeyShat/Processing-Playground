class Cell{
   PVector pos;
   PVector size;
   
   color fillColor = color(255);
   color lineColor = color(0);
   
   Object sign = null;
   
   Cell(PVector p, PVector s){
      this.pos = p; this.size = s; 
   }
   
   PVector getSignPosition(){
     return new PVector(pos.x + size.x * 0.1, pos.y + size.y * 0.1); 
   }
   
   void setSign(Object o){
      this.sign = o; 
   }
   
   boolean hasSign(){
     return sign != null; 
   }
   
   void display(){
      pushMatrix();
      
      fill(fillColor);
      stroke(lineColor);
      strokeWeight(1);
      rect(pos.x, pos.y, size.x, size.y);
      
      if (hasSign()){
         sign.display(new PVector(size.x * 0.8, size.y * 0.8)); 
      }
      
      popMatrix();
   }
  
}
