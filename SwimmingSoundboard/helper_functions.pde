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
      
  sliderFreq1 = p5.addSlider("headPositionSlider")
    .setPosition(190, 50)
    .setSize(20, 200)
    .setRange(110, 196)
    .setValue(baseFreqs[0])
    .setLabel("Head");

  sliderFreq2 = p5.addSlider("footPositionSlider")
    .setPosition(260, 50)
    .setSize(20, 200)
    .setRange(220, 415)
    .setValue(baseFreqs[1])
    .setLabel("Foot");

  sliderFreq3 = p5.addSlider("bodyAngleSlider")
    .setPosition(330, 50)
    .setSize(20, 200)
    .setRange(440, 785)
    .setValue(baseFreqs[2])
    .setLabel("Body");

  sliderFreq4 = p5.addSlider("hipPositionSlider")
    .setPosition(400, 50)
    .setSize(20, 200)
    .setRange(880, 1570)
    .setValue(baseFreqs[3])
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
  glideFreq1 = new Glide(ac, baseFreqs[0], 30);
  glideFreq2 = new Glide(ac, baseFreqs[1], 30);
  glideFreq3 = new Glide(ac, baseFreqs[2], 30);
  glideFreq4 = new Glide(ac, baseFreqs[3], 30);

  sine1 = new WavePlayer(ac, glideFreq1, Buffer.SINE);
  sine2 = new WavePlayer(ac, glideFreq2, Buffer.SINE);
  sine3 = new WavePlayer(ac, glideFreq3, Buffer.SINE);
  sine4 = new WavePlayer(ac, glideFreq4, Buffer.SINE);
}
