//globals
float[] values;
int i = -1;
int j = 0;
int r = 8;
int buffer = 8;
int start = 1;
int count = -1;

import java.util.Random; 

void setup() {
  //setup screen and frame rate
  fullScreen(P2D);
  frameRate(20);
  
  //build array to be sorted
  values = new float[40];
  for (int i = 0; i < values.length; i++) {
    values[i] = r * (int(random(height - 20)/r));
  }
}

void draw() {
  //initialize variables
  background(0);
  int step = (width/values.length);
  
  //check to see if this is the first time in loop
  if (start == 1){
  count = values.length - 1;
  }
  //if drawing is done, close
  if (count < 1){noLoop();}
  
  //reset outer loop 
  if (i == count) {
    i = 0;
    count--;
  }
  //bubblesort inner loop
  if(i != -1 && i != 39) {
    float a = values[i];
    float b = values[i+1];
    if (a > b) {
      swap(values, i, i+1);
    }
  }
  //draw representations of items in array, turn current item red
  int tick = 0;
  for (int u = buffer; u < width - buffer; u+= (step)) {
    fill(255, 255, 255, 150);
    if(u == (i*step + buffer)){fill(100, 0, 0);}
    for(float k = ((height - values[tick])/2); k <= values[tick] + ((height - values[tick])/2); k+=r) {
      if (k == ((height - values[tick])/2)) {
        ellipse(u, k - .5 * r, 1.5*r, 1.5*r);
      } else if (k == (values[tick] + (height - values[tick])/2)){      
        ellipse(u, k + 0.5 * r, 1.5*r, 1.5 * r);
      } else {
        ellipse(u, k, r, r);
      }
    }
    tick++;
  }
  //increment i and set start to 0 to begin countdown
  start = 0;
  i++;
  //save starting array
  if(frameCount == 1){
    saveFrame("run-####.png");
  }
}

//function to swap values in array
void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
