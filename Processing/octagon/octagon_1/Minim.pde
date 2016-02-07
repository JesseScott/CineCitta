
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
    br = random(255) + ba;
    kickSize = 2;
    snareSize = 1;
    hatSize = 1;
  }
  if(beat.isSnare()) {
    bg = random(255) + ba;
    kickSize = 1;
    snareSize = 2;
    hatSize = 1;
  }
  if(beat.isHat()) {
    bb = random(255) + ba;
    kickSize = 1;
    snareSize = 1;
    hatSize = 2;
  }
  fft.forward(in.mix);  
  ba = map(in.mix.level(), 0.0, 1.0, 0, 255);
}
