//globals
float[] values;
int i = -1;
int j = 0;
int r = 8;
int fin = 0;
int buffer = 20;
int start = 1;
float bail; 
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
  count = 0;
  }
  //reset inner loop, increment outer loop
  if (i == 0) {
    count++;    
    i = count;
  }
  //insertion sort inner loop
  if(i != -1 && i < values.length && fin ==0) {
    float a = values[i];
    float b = values[i-1];
    if (a < b) {
      swap(values, i, i-1);
    } else {i = 0;}
  }
  
  //bail conditions
  //if(i == 41) {bail = values[width];}
  
  if (i == 40) {
    fin = 1;
  }  
  //decrement i
  i--;
  
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
  //set start to 0 to begin countdown
  start = 0;
  
  if (i == -2){i+= 2;}
  
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





  //if (i < values.length) {
  //  i = 0;
  //  //for (int j = i; j > 0; j--) {
  //    if (values[j-1] > values[j]){
  //      swap(values, j-1, j);
  //    //} else break;
  //  //}
  //} else {
  //  println("finished");
  //  for(int t = 0; t < values.length; t++) {
  //    println(values[t]);
  //  }
  //}
