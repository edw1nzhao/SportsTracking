import beads.*;
import controlP5.*;
import java.util.*;

ControlP5 p5;

//Audio Related Variables
AudioContext ac; 
float baseFreq = 440.0;
Gain g;

WavePlayer sine1;
WavePlayer sine2;
WavePlayer sine3;
WavePlayer sine4;

Glide glideFreq1;
Glide glideFreq2;
Glide glideFreq3;
Glide glideFreq4;

Slider sliderFreq1;
Slider sliderFreq2;
Slider sliderFreq3;
Slider sliderFreq4;

float[] freqRatios;
float[] baseFreqs;

int currentFreq1 = 0;
int currentFreq2 = 0;
int currentFreq3 = 0;
int currentFreq4 = 0;


void setup() {
  size(500, 300);
  p5 = new ControlP5(this);
  ac = new AudioContext();
  freqRatios = new float[]{1.0, 9.0/8.0, 81.0/64.0, 3.0/2.0, 27.0/16.0};
  baseFreqs = new float[]{110, 220, 440, 880};
  
  sineSetup();
  
  g = new Gain(ac, 1, 0.5);

  g.addInput(sine1);
  g.addInput(sine2);
  g.addInput(sine3);
  g.addInput(sine4);
  
  ac.out.addInput(g);
  ac.start();
  
  UI();
}


void draw(){
  background(0);
}

// Sliders ===============================
void headPositionSlider(float value) {
  //slideFreq1.setValue(value);
}

void footPositionSlider(float value) {
  //slideFreq2.setValue(value);
}

void bodyAngleSlider(float value) {
  //slideFreq3.setValue(value);
}

void hipPositionSlider(float value) {
  //slideFreq4.setValue(value);
}

// UI ====================================

void UI() {
  sliderFreq1 = p5.addSlider("headPositionSlider")
    .setPosition(50, 50)
    .setSize(20, 200)
    .setRange(110, 196)
    .setValue(baseFreqs[0])
    .setLabel("Head Position");

  sliderFreq2 = p5.addSlider("footPositionSlider")
    .setPosition(140, 50)
    .setSize(20, 200)
    .setRange(220, 415)
    .setValue(baseFreqs[1])
    .setLabel("Foot Position");

  sliderFreq3 = p5.addSlider("bodyAngleSlider")
    .setPosition(230, 50)
    .setSize(20, 200)
    .setRange(440, 785)
    .setValue(baseFreqs[2])
    .setLabel("Body Angle");

  sliderFreq4 = p5.addSlider("hipPositionSlider")
    .setPosition(320, 50)
    .setSize(20, 200)
    .setRange(880, 1570)
    .setValue(baseFreqs[3])
    .setLabel("Hip Position");
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

void keyPressed() {
  int freqLength = freqRatios.length - 1;
  float newFreq;
  if (key == 'q') {
    currentFreq1 = Math.min(freqLength, currentFreq1 + 1);
    newFreq = baseFreqs[0] * freqRatios[currentFreq1];
    sliderFreq1.setValue(newFreq);
    glideFreq1.setValue(newFreq);


  } else if (key == 'a') {
    currentFreq1 = Math.max(0, currentFreq1 - 1);
    newFreq = baseFreqs[0] * freqRatios[currentFreq1];
    glideFreq1.setValue(newFreq);
    sliderFreq1.setValue(newFreq);


  } else if (key == 'w') {
    currentFreq2 = Math.min(freqLength, currentFreq2 + 1);
    newFreq = baseFreqs[1] * freqRatios[currentFreq2];
    glideFreq2.setValue(newFreq);
    sliderFreq2.setValue(newFreq);


  } else if (key == 's') {
    currentFreq2 = Math.max(0, currentFreq2 - 1);
    newFreq = baseFreqs[1] * freqRatios[currentFreq2];
    glideFreq2.setValue(newFreq);
    sliderFreq2.setValue(newFreq);


  } else if (key == 'e') {
    currentFreq3 = Math.min(freqLength, currentFreq3 + 1);
    newFreq = baseFreqs[2] * freqRatios[currentFreq3];
    glideFreq3.setValue(newFreq);
    sliderFreq3.setValue(newFreq);


  } else if (key == 'd') {
    currentFreq3 = Math.max(0, currentFreq3 - 1);
    newFreq = baseFreqs[2] * freqRatios[currentFreq3];
    glideFreq3.setValue(newFreq);
    sliderFreq3.setValue(newFreq);

  } else if (key == 'r') {
    currentFreq4 = Math.min(freqLength, currentFreq4 + 1);
    newFreq = baseFreqs[3] * freqRatios[currentFreq4];
    glideFreq4.setValue(newFreq);
    sliderFreq4.setValue(newFreq);

  } else if (key == 'f') {
    currentFreq4 = Math.max(0, currentFreq4 - 1);
    newFreq = baseFreqs[3] * freqRatios[currentFreq4];
    glideFreq4.setValue(newFreq);
    sliderFreq4.setValue(newFreq);
  }
}