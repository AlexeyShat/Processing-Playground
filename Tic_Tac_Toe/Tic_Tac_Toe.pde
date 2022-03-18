Field f;

void setup(){
   size(400, 400);
   f = new Field(width, height);
}

void draw(){
    background(255);
    
    f.addSign();
    f.display();
    GameResult res = f.checkEnd();
    if (res.gameEnd){
      println("Game Finished");
      if (res.winnerX == ResultType.Type.X){
        println("Winner is X");
      } else if (res.winnerX == ResultType.Type.O){
        println("Winner is O");
      } else {
        println("Tie"); 
      }
      noLoop();
    }
}
