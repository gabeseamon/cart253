import processing.sound.*;

SoundFile song;

Bouncer bouncer;


void setup() {
  
  size(640,480);
  background(255);
  
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,50,10,50),color(255,10,100,50));
  
  
 song = new SoundFile(this, "Shauf.wav");
 
  
 song.loop();
}

void draw() {
  bouncer.update();
  
  bouncer.draw();
  
  float newRate = map(bouncer.x,0,width,0.01,5);
  
  song.rate(newRate);
  
}