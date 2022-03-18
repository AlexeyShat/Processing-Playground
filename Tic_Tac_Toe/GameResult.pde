class GameResult{
  
   ResultType.Type winnerX;
   boolean gameEnd;
   
   GameResult(boolean gEnd, ResultType.Type gWin){
      winnerX = gWin;
      gameEnd = gEnd;
   }
}
