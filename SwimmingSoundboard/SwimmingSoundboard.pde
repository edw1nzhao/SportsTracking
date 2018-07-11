import beads.*;
import controlP5.*;

ControlP5 cp5;

//Audio Related Variables
AudioContext ac; 
float baseFreq = 440.0;
Gain masterGain;

//SINE variables
WavePlayer sineTone;
Glide sineFreq;
Gain sineGain;
float sineGainVal = 0.5;

//UI variables
Slider headPosition;
Slider footPosition;
Slider bodyAngle;
Slider hipPosition;

void setup() {
  size(800, 600);
  cp5 = new ControlP5(this);

  //Basic Audio setup
  ac = new AudioContext();
  masterGain = new Gain(ac, 1, 0.5);
  ac.out.addInput(masterGain);

  //Sine Wave Code
  //In the example they had multiple sinewaves for wave generation but I think using just one should be ok
  sineFreq = new Glide(ac, baseFreq, 30);
  sineTone = new WavePlayer(ac, sineFreq, Buffer.SINE);
  sineGain = new Gain(ac, 1, sineGainVal);
  sineGain.addInput(sineTone);
  masterGain.addInput(sineGain);
  
  //Play
  ac.start();



  //UI Setup
  headPosition = cp5.addSlider("headPositionSlider")
    .setPosition(90, 100)
    .setSize(20, 400)
    .setRange(0, 10)
    .setValue(0)
    .setLabel("Head Position");

  footPosition = cp5.addSlider("footPositionSlider")
    .setPosition(290, 100)
    .setSize(20, 400)
    .setRange(0, 10)
    .setValue(0)
    .setLabel("Foot Position");

  bodyAngle = cp5.addSlider("bodyAngleSlider")
    .setPosition(490, 100)
    .setSize(20, 400)
    .setRange(0, 180)
    .setValue(0)
    .setLabel("Body Angle");

  hipPosition = cp5.addSlider("hipPositionSlider")
    .setPosition(690, 100)
    .setSize(20, 400)
    .setRange(0, 10)
    .setValue(0)
    .setLabel("Hip Position");
}


void draw(){
  background(0);
}

//Action Listeners
void headPositionSlider(float value) {
}

void footPositionSlider(float value) {
}

void bodyAngleSlider(float value) {
}

void hipPositionSlider(float value) {
}
