// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed, size and scores
  int SPEED = 5;
  int SIZE = 16;
  int SCORELEFT = 0;
  int SCORERIGHT = 0;
  

  // The location of the ball, made floats because of the exponential movement 
  float x;
  float y;

  // The velocity of the ball, made floats because of the exponential movement
  float vx;
  float vy;

  // The colour of the ball
  color ballColor = color(127, 0, 127);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    
    // Check if the ball is going off the top or bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }
  
  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity
  // also reset the balls velocity and score
  
  void reset() {
    
    x = width/2;
    y = height/2;
    // resets the score and ball if a player wins by 3
    if(SCORELEFT > SCORERIGHT + 2 || SCORERIGHT > SCORELEFT + 2) {
      vx = 5;
      vy = 5;
      
      SCORELEFT = 0;
      SCORERIGHT = 0;
      
      
    
      }
         
  }
 
  
 
  
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }
  void updateScore() {
  // these add the score when the ball goes off screen, and reset its velocity
  if (x + SIZE/2 < 0)
  { SCORELEFT++;
   vx = -05;
   vy = 5;
  }
  
  if (x - SIZE/2 > width)
  { SCORERIGHT++;
  vx = 5;
  vy = 5;
  }
  //prints the score
  println(SCORELEFT + "   " + SCORERIGHT);
  
  //lets the players know if they've won
  if (SCORELEFT > SCORERIGHT + 2){
    println("Left player WINS!");
    
  }
  if (SCORERIGHT > SCORELEFT + 2){
    println("Right player WINS");
    
  }
  }

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
    
   
    // Check if the ball overlaps with the paddle
      if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
       x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      }
      else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
       x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
      //these two lines makes it so if the paddle is moving when the ball hits it, it increases the balls x or y velocity
      if (insideLeft && insideRight && insideTop && insideBottom && paddle.vy > 0) {
        vx = vx*1.2;
      
      }
      if (insideLeft && insideRight && insideTop && insideBottom && paddle.vy < 0) {
        vy = vy*1.2;
      }
      //these reset the balls velocity if it gets to high
      if (vx > 17) {
        vx = 5;
      }
      if (vy > 17) {
        vy = 5;
   
      }
      
    }
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }
}