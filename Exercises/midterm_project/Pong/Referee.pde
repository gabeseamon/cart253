class Referee {
  //variables for x, y and the ref
  int x;
  int y;
  PImage ref;
  
  //constructor for the ref, starting values and sets position
  Referee (int _x, int _y, PImage _ref) {
    x = _x;
    y = _y;
    ref = _ref;
  }

  //updates the ref to face whichever half of the screen the ball is on
  void update(Ball ball) {
    imageMode(CENTER);
    pushMatrix();
    translate(x, y);
    if (ball.x < width/2) {
      scale(-1, 1);
  } else {
  scale(1, 1);
}
image(ref, 0, 0);
popMatrix();

}
//displays ref
void display() {
  imageMode(CENTER);
    image (ref, x, y);
  
}


}