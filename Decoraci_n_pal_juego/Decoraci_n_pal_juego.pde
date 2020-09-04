float x = 200,y = 100, a = 130, l = 160, t = 0, tim, ang, lon, d = 0;
int modo = 0;
boolean song = true;
float input[] = new float[4];
float[] u = new float[3];
float[][] r = new float[21][3];
PFont mono;

void setup(){
  size(800, 600);
  mono = createFont("Impact", 32);
  for(int i = 0; i <= 20; i++){
      r[i][0] = random(1, 3);
      r[i][1] = random(0, width);
      r[i][2] = 0;
  }
}

void draw(){
  background(0);
  noStroke();
  fill(-1);
  triangle(x, y, x, y+l, x+a, y+l);
  fill(100);
  triangle(x, y+10, x, y+l, x+a-10, y+l);
  /*
  for(int i = 0; i <= 20; i++){
    fill(255, 200+60*sin(r[i][2]/30));
    if(r[i][0]*r[i][2]+r[i][1] >= height*2 || r[i][0]*r[i][2] >= width*2){
      r[i][0] = random(1, 3);
      r[i][1] = random(-width, width/2);
      r[i][2] = 0;
    }
    ellipse(r[i][0]*r[i][2]+r[i][1], r[i][0]*r[i][2], 10, 10);
    ellipse(r[i][0]*r[i][2]-2+r[i][1], r[i][0]*r[i][2]-2, 8, 8);
    ellipse(r[i][0]*r[i][2]-5+r[i][1], r[i][0]*r[i][2]-5, 5, 5);
    ellipse(r[i][0]*r[i][2]-8+r[i][1], r[i][0]*r[i][2]-8, 2, 2);
    r[i][2]++;
  }*/
  println( " X: " + x + " Y: "+ y);
  
}

void keyPressed(){
  if(key == 'd' || key == 'D'){
    input[1] = 'd';
  }if(key == 'a' || key == 'A'){
    input[2] = 'a';
  }if(key == 'w' || key == 'W'){
    input[3] = 'w';
  }
}

void keyReleased(){
  if(key == 'd' || key == 'D'){
    input[1] = 0;
  }if(key == 'a' || key == 'A'){
    input[2] = 0;
  }if(key == 'w' || key == 'W'){
    input[3] = 0;
  }
}
