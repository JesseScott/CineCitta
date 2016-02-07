

// IMPORTS
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.analysis.*;


// DECLARATIONS
BeatBox br, bg, bb;
Minim minim;
AudioInput in;
BeatDetect beat;
BeatListener bl;
PFont myFont;
String[] fontList = PFont.list();


// VARIABLES
int Mode = 2; // drawing mode
boolean fillShape = true;
// mode 1
boolean detected = false; // to avoid NPE
float r, g, b, avg;
float y;
String tempS;
String letterOrder =
  " .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLu" +
  "nT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q";
char[] letters;
char tempR, tempG, tempB;
// mode 2
PImage banner1, banner2, logo;
int beatCount = 5;

//----------------


public void init() {
  frame.removeNotify(); 
  frame.setUndecorated(true);   
  frame.addNotify(); 
  super.init();
}


//-----------


void setup() {
  //
  size(1280, 960, OPENGL);
  background(255);
  smooth();
  noStroke();
  
  frame.setLocation(1020, 0);
  frameRate(30);
  
  //
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 1024);
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  beat.setSensitivity(50);
  bl = new BeatListener(beat, in);
  
  //
  letters = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letterOrder.length()));
    letterOrder.toUpperCase();
    letters[i] = letterOrder.charAt(index);
  }
  
  //
  br = new BeatBox(color(r, g, b), 5*(width/6), 3*(height/4), tempR);
  bg = new BeatBox(color(r, g, b), 5*(width/6), 3*(height/4), tempG);
  bb = new BeatBox(color(r, g, b), 5*(width/6), 3*(height/4), tempB);
  
  //
  banner1 = loadImage("banner-1.jpg");
  banner2 = loadImage("banner-2.jpg");
  logo = loadImage("apabiz logo.png");

}



//-----------



void draw() {
  int fps = round(frameRate);
  println("FPS is " + fps);
  println("MODE is " + Mode);
  println("LEVEL is " + in.mix.level());
  println("BEAT is " + beatCount);
  println("FILL is " + fillShape);
  
  background(0);
  
  if(beat.isKick()) {
    r = random(255);
  }
  if(beat.isSnare()) {
    g = random(255);
  }
  if(beat.isHat()) {
    b = random(255);
  }

  drawingMode();
  
}


//-----------

void keyPressed() {
   if(key != CODED) {
    background(0);
    if (keyCode == '1') {
      Mode = 1;
    }
    else if (keyCode == '2') {
      Mode = 2;
    } 
    else if (keyCode == '3') {
      Mode = 3;
    }
    else if (keyCode == '4') {
      Mode = 4;
    }
    else if (keyCode == '5') {
      Mode = 5;
      //bandName = "";
    }
    else if (keyCode == '6') {
      Mode = 6;
    }
    else if (keyCode == '7') {
      Mode = 7;
    }
    else if (keyCode == '8') {
      Mode = 8;
    }
    else if (keyCode == '9') {
      Mode = 9;
    }
    else if(key == ' ') {
     fillShape =! fillShape; 
    }
   }
   //
   if(key == CODED) {
    if(keyCode == UP) {
      beatCount++;
    }
    else if(keyCode == DOWN) {
      if(beatCount == 1) beatCount = 1;
      if(beatCount > 1) beatCount--; 
    }
  }

}
//-----------

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
