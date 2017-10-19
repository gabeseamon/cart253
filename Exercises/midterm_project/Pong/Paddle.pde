// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed, size and the player image
  float SPEED = 4;
  int HEIGHT = 70;
  int WIDTH = 16;
  PImage rightPlayer;
  
  
  // The position, velocity and acceleration of the paddle (note that vx isn't really used right now)
  float x;
  float y;
  float vx;
  float vy;
  float ay;
  // The fill color of the paddle
  

  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;


  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity and acceleration at 0

  Paddle (int _x,int _y, char _upKey, char _downKey, PImage _rightPlayer) {
    
    rightPlayer = _rightPlayer;
    x = _x;
    y = _y;
    
    vx = 0;
    vy = 0;
    ay = 0;

    upKey = _upKey;
    downKey = _downKey;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity and acceleration (to move the paddle)
    x += vx;
    y += vy;
    vy = vy + (ay * vy);
    

    // Constrain the paddle's y position to be in the window
    y = constrain(y,0 + HEIGHT/2,height - HEIGHT/2);
  }

  // display()
  //
  // Display the paddle at its location
  
  void display() {
    // Set display properties
    imageMode(CENTER);
    image (rightPlayer, x, y);
    
    
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  
  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity and an acceleration of 0.1
      vy = -SPEED;
      ay = 0.1;
      
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity and an acceleration of 0.1
      vy = SPEED;
      ay = 0.1;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }
  }
}