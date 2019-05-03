// Visualizes the time serie  x(n) = k * n whwn k is a constant.
// It illustrates the time series on a circle by connecting each n to x(n)
// for k=2 we have
//    n = {1, 2, 3, 4, ...}
// x(n) = {2, 4, 6, 8, ...}
// It then animates the time series with an increasing k.
// series_size is the max n.
// Nima Sanjabi
// May 01, 2019

int WIDTH = 800;
int HEIGHT = 800;

// for k = 2 we have  x(n) = 2 * n  >>>>   x(n) = {2, 4, 6, 8, 10, 12, }

// For exapmle these configurations show amazing results
// 
//float serie_size = 400;
//float k=300;
//float k_step = 0.05;
//float frame_rate = 30;

//or

//float serie_size = 400;
//float k=7;
//float k_step = 3;
//float frame_rate = 3;


//or

//float serie_size = 1000;
//float k=300;
//float k_step = 0.025;
//float frame_rate = 30;

float serie_size = 400;
float k=7;
float k_step = 3;
float frame_rate = 3;

void setup() {
 size(800, 800);
 background(255);
 frameRate(frame_rate);
 //noLoop();
}


float[][] drawSerie(float serie_size, int center_point, float radius, float k){
  
  float[] target_point = new float[int(serie_size)];
  float[][] coordinate = new float[int(serie_size)][2];

  // The size of each slice in degrees
  float slice_angle;
  circle(center_point, center_point, radius*2);
  
  for (int n=0; n < serie_size; n++){
    // calculate the target point of all the numbers
    target_point[n]= n * k % serie_size;
    //print("target number" + i + " = "+ target_point[i] +"  |  ");
    
    // the arc angle of the slice
    slice_angle = (360/serie_size) * n;
    //print("angle" + slice_angle +"  |  ");
    
    // x and y coordinates of all points on the circle
    coordinate[n][0] = cos(radians(slice_angle))*radius + center_point;
    coordinate[n][1] = sin(radians(slice_angle))*radius + center_point;
    //println(" x = " + coordinate[i][1]);
  }
  
  // draws the lines between initial and target points
  for(int n=0; n<serie_size; n++){
      line(coordinate[n][0],coordinate[n][1],coordinate[int(target_point[n])][0],coordinate[int(target_point[n])][1]);
  }
  
  return coordinate;
}


void draw(){
  //float k_step=11;
  k = k + k_step;
  fill(255);

  stroke(0);
  drawSerie(serie_size, width/2, height/2-100, k);
  textSize(32);

  noStroke();
  rect(0, 0, 200, 50);
  fill(0);
  text(k, 30, 30);
}
