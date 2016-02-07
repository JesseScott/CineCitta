
//-----------

void drawingMode() {
  //
  if (Mode == 1 ) {
    pushMatrix();
    translate(-100, 0);  
    if (beat.isKick()) {
      detected = true;
      r = random(255);
      avg = (r+g+b)/3; 
      int fl = int(r + g + b);
      int fl_ = constrain(fl, 0, fontList.length-1);
      myFont = createFont(fontList[fl_], 256);
      textFont(myFont);
      textSize(avg * 3);
      char tempR = letters[int(r)];
      char tempG = letters[int(g)];
      char tempB = letters[int(b)];
      char[] tempC = {
        tempR, tempG, tempB
      };
      if(fillShape == false) {
        String tempS = new String(tempC);
      }
      else if(fillShape == true) {
        String tempS = "4"; 
      }
      br = new BeatBox(color(r, g, b), 1*(width/6), height/2, tempR);
    }
    if (beat.isSnare()) {
      detected = true;
      g = random(255);
      avg = (r+g+b)/3; 
      int fl = int(r + g + b);
      int fl_ = constrain(fl, 0, fontList.length-1);
      myFont = createFont(fontList[fl_], 256);
      textFont(myFont);
      textSize(avg * 3);
      char tempR = letters[int(r)];
      char tempG = letters[int(g)];
      char tempB = letters[int(b)];
      char[] tempC = {
        tempR, tempG, tempB
      };
      if(fillShape == false) {
        String tempS = new String(tempC);
      }
      else if(fillShape == true) {
        String tempS = "4"; 
      }
      bg = new BeatBox(color(r, g, b), 2*(width/6), height/2, tempG);
    }
    if (beat.isHat()) {
      detected = true;
      b = random(255);
      avg = (r+g+b)/3; 
      int fl = int(r + g + b);
      int fl_ = constrain(fl, 0, fontList.length-1);
      myFont = createFont(fontList[fl_], 256);
      textFont(myFont);
      textSize(avg * 3);
      char tempR = letters[int(r)];
      char tempG = letters[int(g)];
      char tempB = letters[int(b)];
      char[] tempC = {
        tempR, tempG, tempB
      };
      if(fillShape == false) {
        String tempS = new String(tempC);
      }
      else if(fillShape == true) {
        String tempS = "4"; 
      }
      bb = new BeatBox(color(r, g, b), 3*(width/6), height/2, tempB);
    }
    if (beat.isOnset(1) ) {
      avg = (r+g+b)/3; 
      int fl = int(r + g + b);
      int fl_ = constrain(fl, 0, fontList.length-1);
      myFont = createFont(fontList[fl_], 256);
      textFont(myFont);
      textSize(avg * 2);
      y = frameCount;
      detected = true;
    }


    if (detected == true) {
      br.display();
      bg.display();
      bb.display();
    }
    popMatrix();
  }
  // 2
  else if (Mode == 2 ) {

    if (beat.isKick() ) {
      avg = (r+g+b)/3; 
      int fl = int(r + g + b);
      int fl_ = constrain(fl, 0, fontList.length-1);
      myFont = createFont(fontList[fl_], 256);
      textFont(myFont);
    }

    if (frameCount % beatCount == 0) {
      fill(0);
      image(banner1, 0, 0, width, height);


    }
    else {
      fill(255, 0, 0);
      image(banner2, 0, 0, width, height);
      //image(logo, width/2 - 100, height/2);
    }
    ellipseMode(CENTER);
    ellipse(453, 366, 10, 10);
    ellipse(803, 360, 10, 10);
    
    fill(r, g, b);
    textSize(72);
    textAlign(CENTER);
    text("APA", width/2, height/2 + 50);
    text("BIZ", width/2, height/2 + 150);
    text(".DE", width/2, height/2 + 250);
    
  }
  // 3
  else if (Mode == 3 ) {

    stroke(r, g, b); 
    fill(r, g, b);
    //noFill();

    ellipseMode(CORNER);
    ellipse(225, 50, height-100, height-100);
    fill(255);
    ellipse(275, 100, height-200, height-200);
    
    fill(r, g, b);
    
    beginShape(TRIANGLES);
      vertex(250, 25);
      vertex(150, 125); 
      vertex(width/2, height/2 );
    endShape(); 
    
    fill(255);
    noStroke();
    beginShape(TRIANGLES);
      vertex(250, 25);
      vertex(300, 0); 
      vertex(width/2, height/2 );
    endShape(); 
    beginShape(TRIANGLES);
      vertex(75, 175);
      vertex(150, 125); 
      vertex(width/2, height/2 );
    endShape(); 
    
  }
  // 4
  else if(Mode == 4) {
   
    fill(r, g, b);
    for(int i = 0; i < in.bufferSize(); i++) {
      rect(beatCount * i, height, beatCount,  in.mix.get(i)*height);
    }   
    
  }
  // 5
  else if(Mode == 5) {
   int a = round((r+g+b)/3);
   //strokeJoin(ROUND);
   
    if(fillShape == true) {
      fill(r, g, b);
      stroke(r, g, b);
      strokeWeight(a);
    }
    else if(fillShape == false) {
      noFill();
      stroke(r, g, b);
      strokeWeight(a);
    }
    

     if(beat.isKick()) {
       background(255);
       rect(random(width), random(height), beatCount * in.mix.get(a)*r, beatCount *in.mix.get(a)*r);
       rect(random(width), random(height), beatCount * in.mix.get(a)*g, beatCount *in.mix.get(a)*g);
       rect(random(width), random(height), beatCount * in.mix.get(a)*b, beatCount *in.mix.get(a)*b);
     }
     if(beat.isSnare()) {
       //background(255);
       rect(random(width), random(height), beatCount * in.mix.get(a)*r, beatCount *in.mix.get(a)*r);
       rect(random(width), random(height), beatCount * in.mix.get(a)*g, beatCount *in.mix.get(a)*g);
       rect(random(width), random(height), beatCount * in.mix.get(a)*b, beatCount *in.mix.get(a)*b);     
     }
     if(beat.isHat()) {
       //background(255);
       rect(random(width), random(height), beatCount * in.mix.get(a)*r, beatCount *in.mix.get(a)*r);
       rect(random(width), random(height), beatCount * in.mix.get(a)*g, beatCount *in.mix.get(a)*g);
       rect(random(width), random(height), beatCount * in.mix.get(a)*b, beatCount *in.mix.get(a)*b);
     }   

 }
 // 6
  
  
  
}

//-----------

