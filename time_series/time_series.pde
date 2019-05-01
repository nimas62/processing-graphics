int WIDTH = 800;
int HEIGHT = 800;

// This script calculate a time serie of n(i)=x*i
// for x=2 we have  n(i)=2*i  >>>>   n(i)= {2, 4, 6, 8, 10, 12, }

// For exapmle these configurations show amazing results
// 
//float serie_size = 400;
//float multiplier=300;
//float step = 0.05;
//float frame_rate = 30;

//or

//float serie_size = 400;
//float multiplier=7;
//float step = 3;
//float frame_rate = 3;


//or

//float serie_size = 1000;
//float multiplier=300;
//float step = 0.025;
//float frame_rate = 30;

float serie_size = 400;
float multiplier=7;
float step = 3;
float frame_rate = 3;

void setup() {
 size(800, 800);
 background(255);
 frameRate(frame_rate);
}


float[][] drawSerie(float serie_size, int center_point, float radius, float multiplier){
  
  float[] target_point = new float[int(serie_size)];
  float[][] coordinate = new float[int(serie_size)][2];

  // The size of each slice in degrees
  float slice_angle;
  circle(center_point, center_point, radius*2);
  
  for (int i=0; i < serie_size; i++){
    // calculate the target point of all the numbers
    target_point[i]= i * multiplier % serie_size;
    //print("target number" + i + " = "+ target_point[i] +"  |  ");
    
    // the arc angle of the slice
    slice_angle = (360/serie_size) * i;
    //print("angle" + slice_angle +"  |  ");
    
    // x and y coordinates of all points on the circle
    coordinate[i][0] = cos(radians(slice_angle))*radius + center_point;
    coordinate[i][1] = sin(radians(slice_angle))*radius + center_point;
    //println(" x = " + coordinate[i][1]);
  }
  
  // draws the lines between initial and target points
  for(int i=0; i<serie_size; i++){
      line(coordinate[i][0],coordinate[i][1],coordinate[int(target_point[i])][0],coordinate[int(target_point[i])][1]);
  }
  
  return coordinate;
}


void draw(){
  //float step=11;
  multiplier = multiplier + step;
  fill(255);

  stroke(0);
  drawSerie(serie_size, width/2, height/2-100, multiplier);
  textSize(32);

  noStroke();
  rect(0, 0, 200, 50);
  fill(0);
  text(multiplier, 30, 30);
}
