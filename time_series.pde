//int slices_num = 10;
//int center_point = 10;
//int radius = 10;

void setup() {
 size(800, 800);
 background(255);
 //noStroke();
 //noFill();
 noLoop();
 //drawCycle(10, 5);
 
 targetPoint(200, 400, 300, 11);
}

//int timeSerie(int init_num, int current_num) {
// int next_num = (current_num + 1) % init_num;
// int target_num = current_num * next_num % init_num;
// return target_num;
//}



float[] drawCycle(float slices_num, float multiplier){
 float[] target_point = new float[int(slices_num)];
 for (int i=1; i < slices_num; i++){
   target_point[i] = i * multiplier % slices_num;
   //print(target_point[i]);
 }
 return target_point;
}
 
float[][] targetPoint(float slices_num, int center_point, int radius, float multiplier){
  float[] target_point = new float[int(slices_num)];
  float[][] coordinate = new float[int(slices_num)][2];
  float x_component, y_component;
//  float current_x = center_point, current_y=center_point;
  // The size of each slice in degrees
  float slice_angle;
  circle(center_point, center_point, radius*2);
  for (int i=0; i < slices_num; i++){
    //int target_num = timeSerie(10, i);
    target_point[i] = drawCycle(slices_num, multiplier)[i];
    print("target number" + i + " = "+ target_point[i] +"  |  ");
    slice_angle = (360/slices_num) * i;
    print("angle" + slice_angle +"  |  ");
    x_component = cos(radians(slice_angle))*radius + center_point;
    y_component = sin(radians(slice_angle))*radius + center_point;
    
    coordinate[i][0] = x_component;
    coordinate[i][1] = y_component;
    println(" x = " + coordinate[i][1]);
    point(coordinate[i][0],coordinate[i][1]);

//    current_x = x_component;
//    current_y = y_component;  
  }
  for(int i=0; i<slices_num; i++){
      line(coordinate[i][0],coordinate[i][1],coordinate[int(target_point[i])][0],coordinate[int(target_point[i])][1]);
  }

  return coordinate;
}
