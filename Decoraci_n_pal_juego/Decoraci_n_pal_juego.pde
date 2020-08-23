float x = 0,y = 0, a = 0, l = 45, t = 0, tim, ang, lon, d = 0;
int modo = 0;
float input[] = new float[4];
float[] u = new float[3];
PFont mono;

void setup(){
  size(800, 600);
  mono = createFont("Impact", 32);
}

void draw(){
  t = imgPlat(300, 300, 100, 100, t, 255, 50, 255);
  x = flechas(100, 100, 100, 100, x);
  println( " X: " + x + " Y: "+ mouseY);
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
