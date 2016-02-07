
// Function

void mode9_Eq() {
  pushStyle();
  pushMatrix();
  
  if(basic) {
    translate(0, height/2);
    if(beat.isKick()) scale(1.5);
    fill(br, 300 -ba, 300 -ba, 300 -ba);
    stroke(br, 300 -ba, 300 -ba, 300 -ba);
    for(int i = 0; i < in.bufferSize() - 1; i++) {
      rect(i, in.mix.get(i)*50 -ba, i/ba, in.mix.get(i+1)*50 -ba);
    }
  }
  else {
    if(beat.isKick()) {
      strokeWeight(br/ba +1);
      stroke(br +ba, 255-ba, 255-ba, 100 +ba);
      for(int i = 0; i < in.bufferSize() - 1; i++) {
        line(i, height/3 + in.mix.get(i)*50+ba, i+1, height/3 +2 + in.mix.get(i+1)*50+ba);
      }
    }
    if(beat.isSnare()) {
      strokeWeight(bg/ba +1);
      stroke(255-ba, bg +ba, 255-ba, 100 +ba);
      for(int i = 0; i < in.bufferSize() - 1; i++) {
        line(i, height/2 + in.mix.get(i)*50+ba, i+1, height/2 +2 + in.mix.get(i+1)*50+ba);
      }
    } 
    if(beat.isHat()) {
      strokeWeight(bb/ba +1);
      stroke(255-ba, 255-ba, bb +ba, 100 +ba);
      for(int i = 0; i < in.bufferSize() - 1; i++) {
        line(i, (2 * (height/3)) + in.mix.get(i)*50+ba, i+1, (2 * (height/3)) +2 + in.mix.get(i+1)*50+ba);
      }
    } 
  } 
  
  popMatrix();
  popStyle(); 
}
//END
