
class Title {

  boolean finished = false;
  PImage titleScreen;
  // The constructor does nothing
  Title() {
  }
  
  // update()
  //
  // Just displays the title

  void update() {
    display();
  }

  // display()
  //
  // Displays the title of the game with a backround image
  // to press any key
  void display() {
    titleScreen = loadImage("screenone.jpg");
    background(titleScreen);
    textAlign(CENTER, CENTER);
    textSize(64);
    stroke(0);
    fill(250, 0, 0);
    text("Alice?", width/2, height/3);

    textSize(32);
    text("Press any key to continue", width/2, 3*height/4);
  }
  
  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

  void keyPressed() {
    finished = true;
  }

  // keyReleased()
  //
  // Does nothing.
  
  void keyReleased() {
  }
}