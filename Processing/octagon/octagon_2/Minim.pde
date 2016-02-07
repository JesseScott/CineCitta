
//----------------

class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioInput source;
  
  BeatListener(BeatDetect beat, AudioInput source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

//----------------

void analyzeSound() {
  
  
  if(beat.isKick()) {
    br = random(255);
  }
  if(beat.isSnare()) {
    bg = random(255) + 25;
  }
  if(beat.isHat()) {
    bb = random(255) +50;
  }
  int ba = round((br+bg+bb)/3); 
  
  
}
