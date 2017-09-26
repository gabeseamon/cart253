final int CIRCLE_SPEED = 7;
//This sets the speed of the circle to the integer of 7
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); 
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
//These all set different colors to each respective name
final int CIRCLE_SIZE = 50;
//This sets the circle size to the integer of 50

int circleX;
int circleY;
int circleVX;
int circleVY;
//These are all integer variables that are given values in the setup

void setup() {
  size(640, 480);
  //sets the size of the frame
  circleX = width/2;
  //puts the circle in the middle on the x-axis
  circleY = height/2;
  //puts the cirlce in the middle on the y-axis 
  circleVX = CIRCLE_SPEED;
  //sets the value of circleVX to 7
  circleVY = CIRCLE_SPEED;
  //sets the value of circlevy to 7
  stroke(STROKE_COLOR);
  //sets stroke colour to (250, 150, 150)
  fill(NO_CLICK_FILL_COLOR);
  //sets the fill colour to (250, 100, 100)
  background(BACKGROUND_COLOR);
  //sets the backround colour to (250, 150, 150)
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
    //if the mouse is "touching"/in the same spot as the most recent circle its colour is blue.
    ellipse(mouseX, mouseY, (CIRCLE_SIZE + 15), (CIRCLE_SIZE + 15));
    //CHANGED, if the statement above is true it now also creates a larger circle where the mouse is at the time.
    
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
    //if the mouse is not the colour is red
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  //creates the circle
  circleX += circleVX;
  //adds value of 7 (circle speed) to the x axis of the circle
  circleY += circleVY;
  //adds value of 7 (circle speed) to the y axis of the circle
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
    //if the circle's x value is greater then the width or less then 0 the value of circleVX gets inverted (turned negative)
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
    //if the circle's y value is greater then the height or less then 0 the value of circleVY gets inverted (turned negative)
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
  //if the mouse gets clicked the backround colour resets
}