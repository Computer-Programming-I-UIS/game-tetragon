float Quadrangle(float t, float xi, float yi){
  if(mousePressed){
    if(mouseX >= x || mouseX <= x)
    x += (mouseX-x)/10;
    if(mouseY >= y || mouseY <= y)
    y += (mouseY-y)/10;
    if(dist(x, y, mouseX, mouseY) <= 1){
      x = mouseX;
      y = mouseY;
      prueba = new Plataforma( mouseX-10, mouseY-10, 20, 20, 1, grilla);
      prueba.sprite();
    }
    t = 0;
  }else{
    t += 0.2;
    x += (xi-a-x)/10;
    y += (yi-a-y)/10+sin(t/6);
  }
  pushMatrix();
  translate(x, y);
  rotate(t);
  noStroke();
  fill(25, 25 ,200);
  rect(-a, -l, 2*a, 2*l);
  fill(250, 250, 0);
  rect(-a/4, -l/4, a/2, l/2);
  popMatrix();
  return t;
}
