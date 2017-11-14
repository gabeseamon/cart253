import processing.sound.*;

SoundFile song;

Bouncer bouncer;



void setup() {
  
  size(640,480);
  background(255);
  
  //Sets up single bouncer
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,50,10,50),color(255,10,100,50));
  
  //loads song
 song = new SoundFile(this, "Surfer.mp3");
 
  song.loop();
}

void draw() {
  bouncer.update();
  
  bouncer.draw();
  
  //makes the rate of playback change with the x value of the bouncer.
  float newRate = map(bouncer.x,0,width,0.001,5);
  
  //instructions on how to pause song
  textSize(20); // Font size
  textAlign(CENTER,CENTER); // Center align both horizontally and vertically
  textLeading(20); // Line height for text
  text("Put your mouse on bouncer to stop song at proper speed!.",width/2,height/3);
  
  
  song.rate(newRate);
  
}