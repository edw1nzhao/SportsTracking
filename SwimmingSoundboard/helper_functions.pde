//AudioContext ac; //needed here because getSamplePlayer() uses it below
// UI ====================================

void UI() {
  fill(color(100));
  rect(20, 20, 450, 250);
  
  p5.addTextlabel("title")
     .setText("Swim Dive Soundboard")
     .setPosition(30, 30);
     
  p5.addButton("play")
    .setPosition(50, 100)
    .setLabel("Play / Pause");
      
  sliderClickInterval = p5.addSlider("headPositionSlider")
    .setPosition(190, 50)
    .setSize(20, 200)
    .setRange(100, 1600)
    .setValue(400)
    .setLabel("Head");

  sliderFreq1 = p5.addSlider("footPositionSlider")
    .setPosition(260, 50)
    .setSize(20, 200)
    .setRange(220, 415)
    .setValue(baseFreqs[1] * freqRatios[2])
    .setLabel("Foot");

  sliderFreq2 = p5.addSlider("bodyAngleSlider")
    .setPosition(330, 50)
    .setSize(20, 200)
    .setRange(440, 785)
    .setValue(baseFreqs[2] * freqRatios[2])
    .setLabel("Body");

  sliderFreq3 = p5.addSlider("hipPositionSlider")
    .setPosition(400, 50)
    .setSize(20, 200)
    .setRange(880, 1570)
    .setValue(baseFreqs[3] * freqRatios[2])
    .setLabel("Hip");
}

void play() {
  if (g.isPaused()) {
    g.pause(false);
  } else {
    g.pause(true);
  }
}

void sineSetup() {
  clickGlide = new Glide(ac, 400, 30);
  glideFreq1 = new Glide(ac, baseFreqs[1], 30);
  glideFreq2 = new Glide(ac, baseFreqs[2], 30);
  glideFreq3 = new Glide(ac, baseFreqs[3], 30);

  //sine1 = new WavePlayer(ac, glideFreq1, Buffer.TRIANGLE);
  sine1 = new WavePlayer(ac, glideFreq1, Buffer.SINE);
  sine2 = new WavePlayer(ac, glideFreq2, Buffer.SINE);
  sine3 = new WavePlayer(ac, glideFreq3, Buffer.SINE);

  try {
    click = getSamplePlayer("click.wav", false);
  } catch(Exception e) {
    e.printStackTrace();
  }
}

//helper functions

Sample getSample(String fileName) {
 return SampleManager.sample(dataPath(fileName)); 
}

SamplePlayer getSamplePlayer(String fileName, Boolean killOnEnd) {
  SamplePlayer player = null;
  try {
    player = new SamplePlayer(ac, getSample(fileName));
    player.setKillOnEnd(killOnEnd);
    player.setName(fileName);
  }
  catch(Exception e) {
    println("Exception while attempting to load sample: " + fileName);
    e.printStackTrace();
    exit();
  }
  
  return player;
}

SamplePlayer getSamplePlayer(String fileName) {
  return getSamplePlayer(fileName, false);
}


void clockSetup() {
  clock = new Clock(ac, clickGlide);


  
  clock.addMessageListener(

    new Bead() {

      int pitch;
      public void messageReceived(Bead message) {
        Clock c = (Clock)message;
        
        
        if(c.isBeat()) {
          click.reset();
        }
      }
    }
  );
}