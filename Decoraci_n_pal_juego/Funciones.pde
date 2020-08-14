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

float lightOn(float u){
  if(key == 'o'){
    fill(0, 0, 0, u);
    rect(0, 0, width, height);
    u += 2;
  }else{
    u = 0;
  }
  return u;
}

float Quadrangle(float t){
  if(mousePressed){
    if(mouseX >= x || mouseX <= x)
    x += (mouseX-x)/10;
    if(mouseY >= y || mouseY <= y)
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
  fill(0);
  rect(-2*a, -2*l, 4*a, 4*l);
  fill(250, 250, 0);
  rect(-a/2, -l/2, a, l);
  popMatrix();
  return t;
}
