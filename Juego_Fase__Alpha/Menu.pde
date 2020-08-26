float[] menu (float t, float d, float x, float c){
  t++;
  rectMode(CORNER);
  noStroke();
  pushMatrix();
  for(int i = 0; i <= 20; i++){
    for(int j = 0; j <= 20; j ++){
      fill(255);
      if(t%300 == 0 && modo == 0){
        t=0;
        u[0] = int(random(1, 3)); //Colores aleatorios que aparecen en el fondo
        u[1] = int(random(1, 3));
        u[2] = int(random(1, 3));
      }
      fill(2*i*u[0], 20+2*j*u[1], u[2]*(i+j), 3*255/4*sin(PI*t/150)); //Se van continuamente apagando y volviendo a prender
      rect(i*width/20, j*height/20, 20, 20);
    }
  }
  translate(width/2-275+10*cos(PI*(t)/150), 100); //Generar movimiento en el título
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
  textSize(abs(sin(PI*t/150)*5+15)); //El texto también se mueve
  text("PRESIONA ENTER PARA EMPEZAR", width/2, 3*height/5);
  textSize(abs(sin(PI*t/150)*5+12.5));
  text("PRESIONA C PARA LOS CRÉDITOS",  width/2, 3*height/5+50); 
  textSize(abs(sin(PI*t/150)*5+10));
  text("PRESIONA ESCAPE PARA SALIR",  width/2, 3*height/5+100);  
  if(menu == -1){ //Cinemática
    fill(0, 0, 0, d);
    rect(0, 0, width, height);
    d += 2;
    if(d > 255){
      background(0);
      noStroke();
      textAlign(CENTER);
        switch (modo){ //Cada modo representa una parte de la cinemática inicial
          case -1: //Excepto en modo = -1. Estos son los créditos
            pushMatrix();
            fill(255);
            translate(width/2, -c+3*height/2);
            textFont(mono);
            textSize(15);
            textAlign(CENTER);
            text("Tetragon", 0, -2*height/5);
            text("Créditos", 0, -height/8);
            text("A freeSound.org por su plataforma para descargar fácilmente variedad de sonidos", 0, 30);
            text("Al usuario sharesynth de la anterior plataforma, creador del audio de salto usado en el juego ", 0, 90);
            text("Al usuario Sergenious de la anterior plataforma, creador del audio de teletransportación usado en el juego", 0, 150);
            text("Al usuario TheDweebMan de la anterior plataforma, creador del audio de apuntar usado en el juego", 0, 210);
            text("A Aaron Daniel, youtuber y creador de los remix utilizados en el menú y en el nivel del juego", 0, 270);
            text("A Relogic, equipo desarrolador del videojuego Terraria, que fueron los creadores originales de 2 canciones del juego", 0, 330);
            text("A Geoffrey Lee creador de la fuente IMPACT, usada en este proyecto", 0, 390);
            text("Al equipo de Nexile, creadores de Jump King, principal fuente de inspiración del juego", 0, 450);
            text("A tí, por regalarnos tu valioso tiempo", 0, 570);
            popMatrix();
            c++;
            break;
          case 1: 
            tetraCine(width/2-50, height/2-200, 1);
            fill(255, t);
            textFont(mono);
            textSize(25);
            text("Hola, soy Tetra, uno de los dos habitantes de Euclidius...", width/2, height-100);
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
            text("El otro es él, se llama Rubik, se la pasa flotando cerca de mí...", width/2, height-100);
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
            text("Todo el tiempo lo pasamos juntos, es como mi sombra,", width/2, height-100);
            textSize(25);
            text("desde que existo ha estado a mi lado...", width/2, height-70);
            break;
          case 4: //estrellas
            for(int i = 0; i <= 10; i++){
              fill(255, 20+50*sin(t/20));
              ellipse(150+50*i, 250+75*sin(PI*i/4), 10, 10);
              fill(255, 20+50*sin(t/20+PI/4));
              ellipse(150+50*i, 250-75*sin(PI*i/4), 10, 10);
              fill(255, 20+50*sin(t/20+PI/2));
              ellipse(150+50*i, 250-75*cos(PI*i/4), 10, 10);
              fill(255, 20+50*sin(t/20+3*PI/4));
              ellipse(150+50*i, 250+75*cos(PI*i/4), 10, 10);
            }
            fill(255, t);
            textFont(mono);
            textSize(20);
            text("Euclidius es un lugar acogedor, aunque muy monótono y solitario;", width/2, height-100);
            textSize(20);
            text("es por eso que siempre me he preguntado que habrá más allá...", width/2, height-70);
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
            text("Rubik nunca ha pensado en eso, no sé si lo ignora,", width/2, height-100);
            textSize(20);
            text("si no me lo dice porque no sabe hablar,", width/2, height-75);
            textSize(20);
            text("o si simplemente no puede hablar...", width/2, height-50);
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
            text("Sea como sea, ya es hora de cambiar, no podemos quedarnos por siempre aquí", width/2, height-100);
            textSize(20);
            text("¡No solamente hay que vivir la vida, también hay que triunfar en ella!", width/2, height-70);
            break;
          case 7:
            tetraCine(width/6, 50, 0.4);
            flechas(width/6, height/3, 50, 50, t);
            fill(255, t);
            textFont(mono);
            textSize(20);
            text("Manejas a Tetra con las teclas 'A' y 'S'", 3*width/4-100, height/6);
            text("Saltas con 'F''", 3*width/4-100, height/6+25);
            text("Si estás sobre las flechas, puedes subir usando la tecla 'W'", 3*width/4-100, height/3+10);
            image(Modos, 50, height/2+50);
            textSize(15);
            textMode(CORNER);
            text("Con click pasas al modo apuntar", 125, height/2+25);
            text("Rubik empezará a girar alrededor de ti", 135, height/2+50);
            text("Presionando de nuevo, saldrá una barra", 300, height-100);
            text("esta determina la fuerza", 300, height-75);
            text("Con un 3er click Rubik saldrá volando", width/2+100, height/2+25);
            text("Cuando él choque", width-85, height-100);
            text("aparecerás en ese lugar", width-85, height-75);
            break;
        }

      noStroke();
      if(modo != 0 && (x >= 5*width || x <= 500)){ 
        fill(255, 100+100*sin(x/500-width/100-PI/2));
        textFont(mono);
        textSize(10);
        if(modo != -1){
          text("Presiona una tecla para continuar", 100, height-40); //Aviso para adelantar cinemática
          text("Presiona S para saltarte la introducción", 100, height-25);
        }
      }
      fill(255);
      if(x >= 2*width){
        fill(255, 255-0.2*(x-2*width));
        if(x == 2*width){ //Cambiar modo al terminar transición 
          modo++;
          t = 0;
        }
      }
      for(int i = 0; i <= height/20; i++){
        if(x <= 5*width){
          rect(0, height/5*i+height/10, x, height/10); //Rectangulos para la transición
          rect(width, height/5*i, -x, height/10);
        }else if(keyPressed && modo >= 0){
          x = 0;
        }
      }
      x += 10;
      if(modo > 7){ //Si modo es mayor a 7 la cinemática concluye
      menu = 1;
      modo = 0;
      }if(c >= 2.7*height){ //Cuando ya subieron volvemos al menú
        modo = 0;
        menu = 0;
        c = 0;
        d = 0;
        t = 0;
        x = 0;
      }
    }
  }
  float [] respuesta = {t, d, x, c};
  return respuesta;
}

/*_________________________________________________________________________________________________________________________________________*/

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
  if(modo != 6 && modo != 7){ //Tetra moviendose
    for(int i = 1; i <= 4; i++){
      for(int j = 1; j <= 4; j++){
        rect(10*i+1, 30+10*j, 7, 7);
      }
    }
  }else{ //Tetra estático
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
