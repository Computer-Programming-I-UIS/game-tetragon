int transicion(int x){
  noStroke();
  fill(0);
  if( x >= width){
      fill(0, 0, 0, 255-0.2*(x-width));
  }
  for(int i = 0; i <= 10; i++){
    if(x <= 5*width){
      rect(0, 80*i+40, x, 40);
      rect(width, 80*i, -x, 40);
    }
  }
  x += 10;
  return x;
}

void fuego(){
  for(int i = 1; i <= 20; i++){
    float u = random(-1, 1);
    fill(255, 200, 0, 255-255/20*i);
    ellipse(width/2, height/2, i*i/10+u, i*i/10+u);
  }
}

float lightOn(float u, float c){
  if(key == ENTER){
    fill(c, c, c, u);
    rect(0, 0, width, height);
    u += 2;
  }
  return u;
}

float Quadrangle(float t){
  if(mousePressed){
    x += (mouseX-x)/10;
    y += (mouseY-y)/10;
    if(dist(x, y, mouseX, mouseY) <= 1){
      x = mouseX;
      y = mouseY;
    }
    t = 0;
  }else{
    t += 0.2;
    if(100 >= x || 100 <= x)
    x += (100-x)/10;
    if(100 >= y || 100 <= y)
    y += (100-y)/10+sin(t/6);
  }
  pushMatrix();
  translate(x, y);
  rotate(t);
  noStroke();
  fill(255, 0, 0);
  rect(-2*a, -2*l, 4*a, 4*l);
  fill(250, 250, 0);
  rect(-a/2, -l/2, a, l);
  popMatrix();
  return t;
}

float menu (float t){
  noStroke();
  pushMatrix();
  for(int i = 0; i <= 20; i++){
    for(int j = 0; j <= 20; j ++){
      fill(255);
      if(t%300 == 0){
        t=0;
        u[0] = int(random(1, 3));
        u[1] = int(random(1, 3));
        u[2] = int(random(1, 3));
      }
      fill(2*i*u[0], 20+2*j*u[1], u[2]*(i+j), 3*255/4*sin(PI*t/150));
      rect(i*width/20, j*height/20, 20, 20);
    }
  }
  translate(-200, 0);
  translate(width/2-75+10*cos(PI*(t)/150), 100);
  scale(abs(0.04*(sin(PI*t/150)+12)));
  //T
  fill(0, 255, 0);
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
  fill(20, 255, 20);
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
  fill(40, 255, 40);
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
  fill(60, 255, 60);
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
  //A
  fill(80, 255, 80);
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
  fill(100, 255, 100);
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
  fill(120, 255, 120);
  rect(730, 100, 70, 100); 
  //N
  fill(140, 255, 140);
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
  fill(0);
  rect(515, 120, 20, 20);
  rect(595, 120, 20, 20);
  rect(750, 120, 30, 60);
  popMatrix();
  fill(160, 255, 160);
  textAlign(CENTER);
  textFont(mono);
  textSize(abs(sin(PI*t/150)*5+15));
  text("PRESIONA ENTER PARA EMPEZAR", width/2, 3*height/5);
  d = lightOn(d, 0);
  return t;
}
