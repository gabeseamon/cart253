class Score {
  //variables for x, y, width, height and color of the scoreboard
  int x = width/2;
  int y = 460;
  int WIDTH = 130;
  int HEIGHT = 35;
  color scoreColor = color(127, 0, 127);
  
  //constructor for the scoreboard
  Score(int _x, int _y) {
    x = _x;
    y = _y;
  
  }
  
  // this updates to change the color of the scoreboard to show who is winning. 
  // if the scoreboard is more blue the left side is winning and if its more red the right side is winning
void update(Ball ball) {
  rectMode(CENTER);
  
  if (ball.SCORELEFT > ball.SCORERIGHT) {
    scoreColor = color(169, 0, 85);
  }
  if (ball.SCORELEFT > ball.SCORERIGHT + 1) {
    scoreColor = color(211, 0, 43);
  }
  if (ball.SCORELEFT > ball.SCORERIGHT + 2) {
    scoreColor = color(255, 0, 0);
  }
  if (ball.SCORERIGHT > ball.SCORELEFT) {
    scoreColor = color(85, 0, 169);
  }
  if (ball.SCORERIGHT > ball.SCORELEFT + 1) {
    scoreColor = color(43, 0, 211);
  }
  if (ball.SCORERIGHT > ball.SCORELEFT + 2) {
    scoreColor = color(0, 0, 255);
  }
}

    
  
  
  //displays the scoreboard
void display() {
  rectMode(CENTER);
  noStroke();
  fill(scoreColor);
  rect(x, y, WIDTH, HEIGHT);  
 
}
  
  
  
}  