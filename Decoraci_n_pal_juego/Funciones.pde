float cinematica(float x){
  background(0);
  noStroke();
  textMode(CENTER);
    switch (modo){
      case 1: 
        tetraCine(width/2-50, height/2-200, 1);
        fill(255, t);
        textFont(mono);
        textSize(25);
        text("Hola, soy Tetra, uno de los pocos habitantes de Euclidius...", 100, height-100);
        break;
      case 2:
        pushMatrix();
        rectMode(CENTER);
        fill(25, 175 ,200);
        translate(width/2,height/2);
        rotate(t/20-PI/4);
        scale(0.5);
        rect(0, 0,100,100);
        rotate(PI/4);
        fill(25, 25 ,200);
        rect(0, 0,100,100);
        fill(250, 250, 0);
        rect(0,0,25,25);
        popMatrix();
        fill(255, t);
        textFont(mono);
        textSize(25);
        text("El otro es él, se llama Rubik, se la pasa flotando cerca de mí...", 100, height-100);
        break;
      case 3:
        tetraCine(width/2-50, height/2-200, 1);
        pushMatrix();
        rectMode(CENTER);
        fill(25, 175 ,200);
        translate(width/2-100,height/2-100);
        rotate(t/20-PI/4);
        scale(0.5);
        rect(0, 0,100,100);
        rotate(PI/4);
        fill(25, 25 ,200);
        rect(0, 0,100,100);
        fill(250, 250, 0);
        rect(0,0,25,25);
        popMatrix();
        fill(255, t);
        textFont(mono);
        textSize(25);
        text("Todo el tiempo lo pasamos juntos, es como mi sombra", 100, height-100);
        textSize(25);
        text("Desde que existo ha estado a mi lado...", 100, height-70);
        break;
      case 4: //estrellas
        for(int i = 1; i <= 10; i++){
          
        }
        fill(255, t);
        textFont(mono);
        textSize(20);
        text("Euclidius es un lugar acogedor, aunque muy monótono y solitario", 100, height-100);
        textSize(20);
        text("Es por eso que siempre me he preguntado que habrá más allá...", 100, height-70);
        break;

      case 5:
        pushMatrix();
        rectMode(CENTER);
        fill(25, 175 ,200);
        translate(width/2,height/2);
        rotate(t/20-PI/4);
        scale(0.5);
        rect(0, 0,100,100);
        rotate(PI/4);
        fill(25, 25 ,200);
        rect(0, 0,100,100);
        fill(250, 250, 0);
        rect(0,0,25,25);
        popMatrix();
        fill(255, t);
        textFont(mono);
        textSize(20);
        text("Rubik nunca ha pensado en eso, no sé si lo ignora,", 200, height-100);
        textSize(20);
        text("Si no me lo dice porque no sabe hablar", 250, height-75);
        textSize(20);
        text("O si simplemente no puede hablar...", 260, height-50);
        break;
        
      case 6:
        tetraCine(width/2-50, height/2-200, 1);
        pushMatrix();
        rectMode(CENTER);
        fill(25, 175 ,200);
        translate(width/2-100,height/2-100);
        rotate(t/20-PI/4);
        scale(0.5);
        rect(0, 0,100,100);
        rotate(PI/4);
        fill(25, 25 ,200);
        rect(0, 0,100,100);
        fill(250, 250, 0);
        rect(0,0,25,25);
        popMatrix();
        fill(255, t);
        textFont(mono);
        textSize(25);
        fill(255, t);
        textFont(mono);
        textSize(20);
        text("Sea como sea, ya es hora de cambiar, no podemos quedarnos por siempre aquí", 80, height-100);
        textSize(20);
        text("¡No solamente hay que vivir la vida, también hay que triunfar en ella!", 120, height-70);
        break;
    }
  t += 1;  
  noStroke();
  if(x >= 5*width || x <= 500){
    fill(255, t/4+50*sin(t/20));
    textFont(mono);
    textSize(10);
    text("Presiona una tecla para continuar", 100, height-30);
  }
  fill(255);
  if(x >= 2*width){
    fill(255, 255-0.2*(x-2*width));
    if(x == 2*width){
      modo++;
      t = 0;
    }
  }
  for(int i = 0; i <= height/20; i++){
    if(x <= 5*width){
      rect(0, height/5*i+height/10, x, height/10);
      rect(width, height/5*i, -x, height/10);
    }else if(keyPressed){
      x = 0;
    }
  }
  x += 10;
  return x;
}

void fuego(){
  for(int i = 1; i <= 20; i++){
    float u = random(-1, 1);
    fill(255, 200, 0, 255-255/50*i);
    ellipse(width/2, height/2, i*i+u, i*i+u);
  }
}
/*
float lightOn(float u, float c){
  if(key == ENTER){
    fill(c, c, c, u);
    rect(0, 0, width, height);
    u += 2;
  }
  return u;
}
*/
float Quadrangle(float x, float y,float t){
  pushMatrix();
  rectMode(CENTER);
  fill(25, 175 ,200);
  translate(width/2,height/2);
  rotate(t-PI/4);
  scale(0.5);
  rect(0, 0,100,100);
  rotate(PI/4);
  fill(25, 25 ,200);
  rect(0, 0,100,100);
  fill(250, 250, 0);
  rect(0,0,25,25);
  popMatrix();
  t += 0.05;
  return t;
}

float menu (float t){
  t++;
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
  //d = lightOn(d, 0);
  return t;
}

void tetraCine(float x, float y, float s){ 
  rectMode(CORNER);
  pushMatrix();
  translate(x, y); //Esto indica la parte superior izquierda del robot
  scale(s); //Esto indica la escala, usar 0.2 para el juego
  //Brazo Atrás:
  fill(20, 155, 20);
  pushMatrix();
  translate(2.5+pow(lon,2), 140+5*sin(tim/15+1.5));
  rotate(ang);
  rect(-7.5, 0, 15, 60);
  fill(0 , 255, 0);
  rect(-7.5, 50, 15, 10);
  popMatrix();
  //Cabeza:
  pushMatrix();
  fill(20, 155, 20);
  translate(0, 10*sin(tim/15));
  rect(0, 0, 100, 100);
  fill(0 , 255, 0);
  beginShape();
  vertex(50, 0);
  vertex(100, 50);
  vertex(50, 100);
  vertex(0, 50);
  vertex(50, 0);
  endShape();
  fill(20, 155, 20);
  ellipse(50+2*lon, 50, 10, 10);
  popMatrix();
  //Cuerpo:
  pushMatrix();
  fill(50 , 255, 50);
  translate(20, 120+5*sin(tim/15+1));
  rect(0, 0, 60, 100);
  fill(20, 155, 20);
  rect(10, 10, 20, 10);
  rect(30, 10, 20, 10);
  if(modo != 6){
    for(int i = 1; i <= 4; i++){
      for(int j = 1; j <= 4; j++){
        rect(10*i+1, 30+10*j, 7, 7);
      }
    }
  }else{
    ang = PI/3*sin(tim/20);
    lon = sqrt(45);
    rect(40,10, 20, 10);
      for(int i = 1; i <= 2; i++){
        for(int j = 1; j <= 4; j++){
          rect(50-10*i+10, 30+10*j, 10, 10);
        }
    }
  }
  popMatrix();
  //Brazo Adelante
  fill(20, 155, 20);
  pushMatrix();
  translate(100-pow(lon,2), 140+5*sin(tim/15+1.5));
  rotate(-ang);
  rect(-10, 0, 15, 60);
  fill(0 , 255, 0);
  rect(-10, 50, 15, 10);
  popMatrix();
  popMatrix();
  tim++;
}

float flechas(float x, float y, float var){
  strokeWeight(3);
  for(int i = 1; i <= 20; i++){
    if((var+i)%20 == 0){
      fill(0, 255, 255);
    }else{
      fill(50, 50, 150);
    }
    pushMatrix();
    translate(x, y+10*i);
    beginShape();
    vertex(0, 0);
    vertex(50, -20);
    vertex(100, 0);
    vertex(90, 0);
    vertex(50, -10);
    vertex(10, 0);
    endShape();
    popMatrix();
  }
  var++;
  return var;
}
