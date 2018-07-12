import beads.*;
import controlP5.*;

ControlP5 p5;

//Audio Related Variables
AudioContext ac; 
float baseFreq = 440.0;
Gain g;

WavePlayer sine1;
WavePlayer sine2;
WavePlayer sine3;
WavePlayer sine4;

Glide slideFreq1;
Glide slideFreq2;
Glide slideFreq3;
Glide slideFreq4;


void setup() {
  size(500, 300);
  p5 = new ControlP5(this);
  ac = new AudioContext();
  
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
  slideFreq1.setValue(value);
}

void footPositionSlider(float value) {
  slideFreq2.setValue(value);
}

void bodyAngleSlider(float value) {
  slideFreq3.setValue(value);
}

void hipPositionSlider(float value) {
  slideFreq4.setValue(value);
}

// UI ====================================

void UI() {
  p5.addSlider("headPositionSlider")
    .setPosition(50, 50)
    .setSize(20, 200)
    .setRange(50, 800)
    .setValue(baseFreq / 100.0)
    .setLabel("Head Position");

  p5.addSlider("footPositionSlider")
    .setPosition(140, 50)
    .setSize(20, 200)
    .setRange(50, 800)
    .setValue(baseFreq / 100.0)
    .setLabel("Foot Position");

  p5.addSlider("bodyAngleSlider")
    .setPosition(230, 50)
    .setSize(20, 200)
    .setRange(50, 800)
    .setValue(baseFreq / 100.0)
    .setLabel("Body Angle");

  p5.addSlider("hipPositionSlider")
    .setPosition(320, 50)
    .setSize(20, 200)
    .setRange(50, 800)
    .setValue(baseFreq / 100.0)
    .setLabel("Hip Position");
}


void sineSetup() {
  slideFreq1 = new Glide(ac, 20, 30);
  slideFreq2 = new Glide(ac, 20, 30);
  slideFreq3 = new Glide(ac, 20, 30);
  slideFreq4 = new Glide(ac, 20, 30);

  sine1 = new WavePlayer(ac, slideFreq1, Buffer.SINE);
  sine2 = new WavePlayer(ac, slideFreq2, Buffer.SINE);
  sine3 = new WavePlayer(ac, slideFreq3, Buffer.SINE);
  sine4 = new WavePlayer(ac, slideFreq4, Buffer.SINE);
}
