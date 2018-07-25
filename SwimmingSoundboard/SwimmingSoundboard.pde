import beads.*;
import controlP5.*;
import java.util.*;

ControlP5 p5;

//Audio Related Variables
AudioContext ac; 

float baseFreq = 440.0;

Gain g;
Gain sineGain;
Gain sineGainFreq3;


WavePlayer sine1;
WavePlayer sine2;
WavePlayer sine3;

Glide clickGlide;

Glide glideFreq1;
Glide glideFreq2;
Glide glideFreq3;

Slider sliderClickInterval;
Slider sliderFreq1;
Slider sliderFreq2;
Slider sliderFreq3;

float[] freqRatios;
float[] baseFreqs;

float clickInterval = 400;
int currentFreq1 = 2;
int currentFreq2 = 2;
int currentFreq3 = 2;


SamplePlayer click = null;

Clock clock;


void setup() {
  size(490, 290);
  p5 = new ControlP5(this);
  ac = new AudioContext();
  freqRatios = new float[]{1.0, 9.0/8.0, 81.0/64.0, 3.0/2.0, 27.0/16.0};
  baseFreqs = new float[]{110, 220, 440, 880};
  
  sineSetup();

  sineGainFreq3 = new Gain(ac, 1, .5);
  g = new Gain(ac, 1, 0.5);
  sineGain = new Gain(ac, 1, .7);

  clockSetup();
  
  sineGainFreq3.addInput(sine3);
  
  sineGain.addInput(sine1);
  sineGain.addInput(sine2);
  sineGain.addInput(sineGainFreq3);

  g.addInput(click);
  g.addInput(sineGain);
  
  g.pause(true);
  
  ac.out.addInput(g);
  ac.out.addDependent(clock);
  ac.start();
  
  UI();
}


void draw(){
}

void keyPressed() {
  int freqLength = freqRatios.length - 1;
  float newFreq;
  if (key == 'q') {
    clickInterval = Math.min(1600, clickInterval * 2);
    //newFreq = baseFreqs[0] * freqRatios[currentFreq1];
    sliderClickInterval.setValue(clickInterval);
    clickGlide.setValue(clickInterval);
    //println(glideFreq1.getValue());


  } else if (key == 'a') {
    clickInterval = Math.max(100, clickInterval / 2);
    //newFreq = baseFreqs[0] * freqRatios[currentFreq1];
    sliderClickInterval.setValue(clickInterval);
    clickGlide.setValue(clickInterval);
    //println(glideFreq1.getValue());


  } else if (key == 'w') {
    currentFreq1 = Math.min(freqLength, currentFreq1 + 1);
    newFreq = baseFreqs[1] * freqRatios[currentFreq1];
    glideFreq1.setValue(newFreq);
    sliderFreq1.setValue(newFreq);


  } else if (key == 's') {
    currentFreq1 = Math.max(0, currentFreq1 - 1);
    newFreq = baseFreqs[1] * freqRatios[currentFreq1];
    glideFreq1.setValue(newFreq);
    sliderFreq1.setValue(newFreq);


  } else if (key == 'e') {
    currentFreq2 = Math.min(freqLength, currentFreq2 + 1);
    newFreq = baseFreqs[2] * freqRatios[currentFreq2];
    glideFreq2.setValue(newFreq);
    sliderFreq2.setValue(newFreq);


  } else if (key == 'd') {
    currentFreq2 = Math.max(0, currentFreq2 - 1);
    newFreq = baseFreqs[2] * freqRatios[currentFreq2];
    glideFreq2.setValue(newFreq);
    sliderFreq2.setValue(newFreq);

  } else if (key == 'r') {
    currentFreq3 = Math.min(freqLength, currentFreq3 + 1);
    newFreq = baseFreqs[3] * freqRatios[currentFreq3];
    glideFreq3.setValue(newFreq);
    sliderFreq3.setValue(newFreq);

  } else if (key == 'f') {
    currentFreq3 = Math.max(0, currentFreq3 - 1);
    newFreq = baseFreqs[3] * freqRatios[currentFreq3];
    glideFreq3.setValue(newFreq);
    sliderFreq3.setValue(newFreq);
  }
}
