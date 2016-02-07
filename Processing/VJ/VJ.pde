// IMPORTS
import ddf.minim.*;
import ddf.minim.analysis.*;

// MIMIN SETUP
Minim minim;
AudioInput in;
BeatDetect beat;

// VARIABLE DECLRATIONS
  int amount = 0;
  int mode = 1;

void setup() {
  
  // Setup
  size(screen.width, screen.height, P2D);
  background(0);

  // Minim
  minim = new Minim(this);
  minim.debugOn(); 

  // Line In from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 1024);

  // Beat Detection
  beat = new BeatDetect();
  // Sensitivity
  beat.setSensitivity(100);


} // End Setup


// Key Controls

void keyPressed() {
 
 if(key=='1') {
   Mode = 1;
 }
 
 if(key=='2') {
   Mode = 2;
 }
 
 if(key=='3') {
   Mode = 3;
 }
 
 if(key=='0') {
   background(0);
 }

}



// scale

}


 

void draw(){
  

  // background(0);

  beat.detect(in.mix);


  // On New Beat
  if ( beat.isOnset() ) {
    
    // Generate Random RGB Values
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(255);
    
    float s = random(3);

    background(r/3, g/3, b/3);
    fill(r, g, b, a);
    smooth();
   
    
    if(mode == 1) { // DRAW RECT
    rect(0, 0, b + width, a);
    }
    else if (mode == 2) { // DRAW QUAD
     quad(r, g, width -r, height -g, b, a, width -b, height -a); 
    }
    else if (mode == 3) { // DRAW ELLIPSE
     ellipse(r, g, b, a); 
    }
  
 }
} // End Draw





void stop()
{
  // always close Minim audio classes when you are finished with them
  in.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}

