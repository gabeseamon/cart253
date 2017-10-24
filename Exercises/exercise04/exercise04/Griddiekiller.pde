
//new guys that eat griddies in one bite!
class Griddiekiller {
  int x;
  int y;
  int size;
  color fill = color(0,0,255);
  
  Griddiekiller(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
}

void update () {
  
  int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }
}

void collide (Griddie griddies) {
  if (x == griddies.x && y == griddies.y) {
      
      griddies.energy = griddies.energy - 255;
       
}

}

void display() {
   
    fill(fill); 
    noStroke();
    rect(x, y, size, size);
  }

}