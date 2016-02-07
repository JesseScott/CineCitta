
class BeatListener implements AudioListener
{
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
    r = random(255);
  }
  if(beat.isSnare()) {
    gg = random(255);
  }
  if(beat.isHat()) {
    b = random(255);
  }
  aa = round((r+gg+b)/3); 
  
  
}
