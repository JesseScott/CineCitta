
//-----------

class BeatBox {
  color c; // the color of my circle
  float xpos; // the x postion
  float ypos; // the y position
  char msg; // string

  
  
  BeatBox(color _c, float _xpos, float _ypos, char _msg) {
    c = _c;
    xpos = _xpos;
    ypos = _ypos;
    msg = _msg;
  }
  
  void display() {
    float newYPos = frameCount - y;
    fill(c);
    stroke(c);
    float grow = 1.0 + in.mix.level(); 
    scale(grow, grow);
    char[] tempC = {tempR, tempG, tempB};
    String tempS = new String(tempC);
    textAlign(CENTER);
    text(msg, xpos, (3*(height/8)) - newYPos); 
    
  }
  
  
} 

//-----------

