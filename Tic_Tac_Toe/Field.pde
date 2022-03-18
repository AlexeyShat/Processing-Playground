class Field{
   Cell[] cells;
   
   private int fWidth;
   private int fHeight;
   
   private boolean orderX = true;
   private boolean mouseUp = true;
   
   Field(int winWidth, int winHeight){
      cells = new Cell[9];
      
      fWidth = winWidth;
      fHeight = winHeight;
      int w = fWidth / 3;
      int h = fHeight / 3;
      for(int i = 0; i < cells.length; ++i){
        PVector pos = new PVector((i % 3) * w, (i / 3) * h);
        PVector size = new PVector(w, h);
          cells[i] = new Cell(pos, size);
      }
   }
   
   void addSign(){
     if (mousePressed){
         if (mouseUp){
           PVector mpos = new PVector(mouseX, mouseY);
           
           int x = floor(map(mpos.x, 0, fWidth, 0, 3));
           int y = floor(map(mpos.y, 0, fHeight, 0, 3));
           int index = x + y * 3;
           Cell c = cells[index];
           
           if (c.sign == null){
             if (orderX){
               Object obj = new X(c.getSignPosition());
               obj.setColor(color(0,0,255));
               obj.setLineThickness(4);
               c.setSign(obj);
             } else {
               Object obj = new O(c.getSignPosition());
               obj.setColor(color(255,0,0));
               obj.setLineThickness(4);
               c.setSign(obj);
             }
             orderX = !orderX;
             mouseUp = false;
           }
         }
     } else {
       mouseUp = true; 
     }
   }
   
   void display(){
      for(Cell c : cells){
         c.display(); 
      }
   }
   
   GameResult checkEnd(){
     for(int row = 0; row < 3; ++row){
        int k1 = row * 3 + 0; //0 - 3 - 6
        int k2 = row * 3 + 1; //1 - 4 - 7
        int k3 = row * 3 + 2; //2 - 5 - 8
        if (checkCellsInLine(k1, k2, k3)){
          return new GameResult(true,
             (cells[k1].sign instanceof X)? ResultType.Type.X : ResultType.Type.O); 
        }
     }
     for(int col = 0; col < 3; ++col){
        int k1 = 0 * 3 + col; //0 - 1 - 2
        int k2 = 1 * 3 + col; //3 - 4 - 5
        int k3 = 2 * 3 + col; //6 - 7 - 8
        if (checkCellsInLine(k1, k2, k3)){
          return new GameResult(true,
             (cells[k1].sign instanceof X)? ResultType.Type.X : ResultType.Type.O); 
        }
     }
     if (checkCellsInLine(0, 4, 8) || checkCellsInLine(2, 4, 6)){
       return new GameResult(true,
             (cells[4].sign instanceof X)? ResultType.Type.X : ResultType.Type.O); 
     }
     
     boolean hasSpace = false;
     for(int i = 0; i < cells.length; ++i){
       if (cells[i].sign == null){
          hasSpace = true;
          break;
       }
     }
     
     if (!hasSpace){
         return new GameResult(true, ResultType.Type.T);
     }
     
     return new GameResult(false, null);
   }
  
   private boolean checkCellsInLine(int i, int j, int k){
     if (cells[i].sign == null ||
         cells[j].sign == null ||
         cells[k].sign == null){
       return false;      
     }
     boolean f1 = cells[i].sign instanceof X;
     boolean f2 = cells[j].sign instanceof X;
     boolean f3 = cells[k].sign instanceof X;
     
     return (f1 == f2 && f2 == f3);
   }
}
