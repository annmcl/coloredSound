import ddf.minim.*;
import ddf.minim.analysis.*;
import java.awt.*;
import java.util.Random;
 
Minim minim;
AudioInput in;
FFT fft;
Random rand = new Random();

String note;// name of the note
int n;//int value midi note
color c;//color
float hertz;//frequency in hertz
float midi;//float midi note
int noteNumber;//variable for the midi note 
int sampleRate= 44100;//sapleRate of 44100
float [] max= new float [sampleRate/2];//array that contains half of the sampleRate size, because FFT only reads half of the sampleRate frequency. This array will be filled with amplitude values.
float maximum;//the maximum amplitude of the max array
float frequency;//the frequency in hertz
int w;

void setup(){
  size(2800, 1800);
  background(0);//black BG 
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 4096, sampleRate);
  fft = new FFT(in.left.size(), sampleRate);
  w = 0;
}

void draw(){
  findNote(); //find note function
  fill(c);
  int x = rand.nextInt(2800);
  int y = rand.nextInt(1800);
  if(maximum > 5){
    growRandom(x, y);
  }
}

void growRandom(int x, int y){
  ellipse(x, y, w, w);
  w = w+1;
  noStroke();
}

void findNote() {  //<>//
  fft.forward(in.left);
  for (int f=0;f<sampleRate/2;f++) { //analyses the amplitude of each frequency analysed, between 0 and 22050 hertz
    max[f]=fft.getFreq(float(f)); //each index is correspondent to a frequency and contains the amplitude value 
  }
  maximum=max(max);//get the maximum value of the max array in order to find the peak of volume
 
  for (int i=0; i<max.length; i++) {// read each frequency in order to compare with the peak of volume
    if (max[i] == maximum) {//if the value is equal to the amplitude of the peak, get the index of the array, which corresponds to the frequency
      frequency = i; 
    }
  }
 
  midi= 69+12*(log((frequency-6)/440));// formula that transforms frequency to midi numbers
  n= int (midi);//cast to int
 
//the octave has 12 tones and semitones. So, if we get a modulo of 12, we get the note names independently of the frequency  
  if (n == 48){
    note = ("c3"); 
    c = color (0, 128, 43);
  }else if (n == 49){
    note = ("c#3");
    c = color (71, 71, 107);
  }else if (n == 50){
    note = ("d3");
    c = color (230, 115, 0);
  }else if (n == 51){
    note = ("d#3");
    c = color (107, 107, 71);
  }else if (n == 52){
    note = ("e3");
    c = color (0, 102, 204);
  }else if (n == 53){
    note = ("f3");
    c = color (255, 204, 0);
  }else if (n == 54){
    note = ("f#3");
    c = color (115, 38, 77);
  }else if (n == 55){
    note = ("g3");
    c = color (143, 36, 107);
  }else if (n == 56){
    note = ("g#3");
    c = color (0, 102, 102);
  }else if (n == 57){
    note = ("a3");
    c = color (134, 45, 45);
  }else if (n == 58){
    note = ("a#3");
    c = color (38, 115, 77);
  }else if (n == 59){
    note = ("b3");
    c = color (179, 0, 59);
  }else if (n == 60){
    note = ("c4");
    c = color (0, 153, 51);
  }else if (n == 61){
    note = ("c#4");
    c = color (92, 92, 138);
  }else if (n == 62){
    note = ("d4");
    c = color (255, 128, 0);
  }else if (n == 63){
    note = ("d#4");
    c = color (138, 138, 92);
  }else if (n == 64){
    note = ("e4");
    c = color (0, 128, 255);
  }else if (n == 65){
    note = ("f4");
    c = color (255, 214, 51);
  }else if (n == 66){
    note = ("f#4");
    c = color (153, 51, 102);
  }else if (n == 67){
    note = ("g4");
    c = color (184, 46, 138);
  }else if (n == 68){
    note = ("g#4");
    c = color (0, 128, 128);
  }else if (n == 69){
    note = ("a4");
    c = color (172, 57, 57);
  }else if (n == 70){
    note = ("a#4");
    c = color (51, 153, 102);
  }else if (n == 71){
    note = ("b4");
    c = color (230, 0, 76);
  }else if (n == 72){
    note = ("c5");
    c = color (0, 204, 68);
  }else if (n == 73){
    note = ("c#5");
    c = color (133, 133, 173);
  }else if (n == 74){
    note = ("d5");
    c = color (255, 153, 51);
  }else if (n == 75){
    note = ("d#5");
    c = color (173, 173, 133);
  }else if (n == 76){
    note = ("e5");
    c = color (77, 166, 255);
  }else if (n == 77){
    note = ("f5");
    c = color (255, 224, 102);
  }else if (n == 78){
    note = ("f#5");
    c = color (204, 102, 153);
  }else if (n == 79){
    note = ("g5");
    c = color (213, 93, 173);
  }else if (n == 80){
    note = ("g#5");
    c = color (0, 179, 179);
  }else if (n == 81){
    note = ("a5");
    c = color (198, 83, 83);
  }else if (n == 82){
    note = ("a#5");
    c = color (64, 191, 128);
  }else if (n == 83){
    note = ("b5");
    c = color (255, 51, 119);
  }else if (n == 84){
    note = ("c6");
    c = color (26, 255, 102);
  }else if (n == 85){
    note = ("c#6");
    c = color (179, 179, 204);
  }else if (n == 86){
    note = ("d6");
    c = color (255, 191, 128);
  }else if (n == 87){
    note = ("d#6");
    c = color (194, 194, 163);
  }else if (n == 88){
    note = ("e6");
    c = color (128, 191, 255);
  }else if (n == 89){
    note = ("f6");
    c = color (255, 235, 153);
  }else if (n == 90){
    note = ("f#6");
    c = color (217, 140, 179);
  }else if (n == 91){
    note = ("g6");
    c = color (224, 133, 194);
  }else if (n == 92){
    note = ("g#6");
    c = color (0, 230, 230);
  }else if (n == 93){
    note = ("a6");
    c = color (210, 121, 121);
  }else if (n == 94){
    note = ("a#6");
    c = color (121, 210, 166);
  }else if (n == 95){
    note = ("b6");
    c = color (255, 102, 153);
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}
