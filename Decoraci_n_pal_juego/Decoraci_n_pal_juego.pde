float x = 0,y = 0, a = 0, l = 45, t = 0, tim, ang, lon, d = 0;
int modo = 0;
boolean song = true;
float input[] = new float[4];
float[] u = new float[3];
float[][] r = new float[10][2];
PFont mono;

void setup(){
  size(800, 600);
  mono = createFont("Impact", 32);
}

void draw(){
  background(0);
  noStroke();
  for(int i = 0; i <= 9; i++){
    fill(255, abs(200*sin(PI*t/100)));
    if(t%100 == 0){
      r[i][0] = random(i*width/10, (i+1)*width/10);
      r[i][1] = random(20, height-20);
    }
    ellipse(r[i][0], r[i][1], 10, 10);
  }
  t++;
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
