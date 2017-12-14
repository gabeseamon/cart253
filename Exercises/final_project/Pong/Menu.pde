

class Menu {

  // A variable to track the user's selection (starts as NONE)
  State selection = State.NONE;
  PImage menuScreen;
  // A constructor that does nothing
  Menu() {
  }

  // update()
  //
  // The update method just displays the menu
  
  void update() {
    display();
  }

  // display()
  //
  // The display method displays the options available in the game
  
  void display() {
    menuScreen = loadImage("menu.jpg");
    background(menuScreen);
    textAlign(CENTER, CENTER);
    stroke(0);
    fill(230, 20, 0);
    textSize(60);
    text("(P)ONG", width/2, 50);
    text("(B)LUE PONG", width/2, height/2);
  }

  // keyPressed()
  //
  // Called by the main program when the menu is active. If the player
  // presses a key to select one of the game versions, this object
  // will remember the state chosen.
  
  void keyPressed() {
    if (key == 'p' || key == 'P') {
      selection = State.BASIC_PONG;
    } else if (key == 'b' || key == 'B') {
      selection = State.BLUE_PONG;
    }
  }

  // keyReleased()
  //
  // Does nothing.
  
  void keyReleased() {
  }
}