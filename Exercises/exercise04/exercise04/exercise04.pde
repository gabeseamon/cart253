// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
int grideKillerSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
Griddiekiller[] griddieKiller = new Griddiekiller[25];
// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // creates new griddies from each number in array
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
  for (int i = 0; i < griddieKiller.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddieKiller[i] = new Griddiekiller(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      //to check if there are two or more griddies in the same location
      if (j != i) {
        // QUESTION: What does this line check?
        // checks if the griddies collide
        griddies[i].collide(griddies[j]);
      }
      
    }
    
    // Display the griddies
    griddies[i].display();
  }
  for (int i = 0; i < griddieKiller.length; i++) {
    griddieKiller[i].update();
    
    for (int j = 0; j < griddieKiller.length; j++) {
      if (j != i) {
        griddieKiller[i].collide(griddies[j]);
      }
    }
    griddieKiller[i].display();
  }
  
}