float x = 0,y, a = 5, l = 5, t = 0;
float[] u = new float[3];

void setup(){
  size(800, 600);
}

void draw(){
  background(0);
  noStroke();
  for(int i = 0; i <= 20; i++){
    for(int j = 0; j <= 20; j ++){
      fill(255);
      if(t%300 == 0){
        t=0;
        u[0] = int(random(1, 3));
        u[1] = int(random(1, 3));
        u[2] = int(random(1, 3));
      }
      fill(20+2*i*u[0], 20+2*j*u[1], 20+u[2]*(i+j), 3*255/4*sin(PI*t/150));
      rect(i*width/20, j*height/20, 20, 20);
    }
  }
  translate(-200, 0);
  pushMatrix();
  //translate(230, 100);
  //scale(abs(sin(PI*t)/100+0.2));
  fill(255, 0, 0);
  //T
  beginShape();
  vertex(250, 100);
  vertex(320, 100);
  vertex(320, 130);
  vertex(300, 130);
  vertex(300, 200);
  vertex(270, 200);
  vertex(270, 130);
  vertex(250, 130);
  endShape();
  //E
  beginShape();
  vertex(330, 100);
  vertex(400, 100);
  vertex(400, 120);
  vertex(350, 120);
  vertex(350, 140);
  vertex(370, 140);
  vertex(370, 160);
  vertex(350, 160);
  vertex(350, 180);
  vertex(400, 180);
  vertex(400, 200);
  vertex(330, 200);
  endShape();
  //T
  beginShape();
  vertex(410, 100);
  vertex(480, 100);
  vertex(480, 130);
  vertex(460, 130);
  vertex(460, 200);
  vertex(430, 200);
  vertex(430, 130);
  vertex(410, 130);
  endShape();
  //R
  beginShape();
  vertex(490, 100);
  vertex(560, 100);
  vertex(560, 160);
  vertex(550, 160);
  vertex(560, 200);
  vertex(540, 200);
  vertex(510, 160);
  vertex(510, 200);
  vertex(490, 200);
  endShape();
  fill(0, 255, 0);
  //A
  beginShape();
  vertex(570, 100);
  vertex(640, 100);
  vertex(640, 200);
  vertex(610, 200);
  vertex(610, 160);
  vertex(600, 160);
  vertex(600, 200);
  vertex(570, 200);
  endShape();
  //G
  beginShape();
  vertex(650, 100);
  vertex(720, 100);
  vertex(720, 100);
  vertex(720, 120);
  vertex(670, 120);
  vertex(670, 180);
  vertex(700, 180);
  vertex(700, 160);
  vertex(680, 160);
  vertex(680, 140);
  vertex(720, 140);
  vertex(720, 200);
  vertex(650, 200);
  endShape();
  //O
  rect(730, 100, 70, 100); 
  //N
  beginShape();
  vertex(810, 100);
  vertex(830, 100);
  vertex(860, 160);
  vertex(860, 100);
  vertex(880, 100);
  vertex(880, 200);
  vertex(860, 200);
  vertex(830, 150);
  vertex(830, 200);
  vertex(810, 200);
  endShape();
  popMatrix();
  t++;
  fill(0);
  rect(515, 120, 20, 20);
  rect(595, 120, 20, 20);
  rect(750, 120, 30, 60);
  //x = transicion(int(x));
  println( " X: " + mouseX + " Y: "+ mouseY);
}
