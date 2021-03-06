// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles, ball, ref and score
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Referee referee;
Score score;
// variables for the images
PImage bg;
PImage rightPlayer; 
PImage ref;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  //loads the images for the backround, referee and paddle
  bg = loadImage("backround.jpg");
  rightPlayer = loadImage ("player1.jpg");
  ref = loadImage ("referee2.png");
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q', rightPlayer);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p', rightPlayer);
  //creates new ref
  referee = new Referee(width/2, height/2, ref);
  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  //creates the score bar
  score = new Score(width/2, height -460);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(bg);
 
  
  // Update the paddles, ball, ref and score by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  referee.update(ball);
  score.update(ball);

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()){
    //calls the score update
    ball.updateScore();
    // If it has, reset the ball
    
    ball.reset();
  }

  // Display the paddles, ball and score
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  score.display();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}