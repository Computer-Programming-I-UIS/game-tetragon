float x = 0,y = 0, a = 0, l = 45, t = 0, tim, ang, lon, d = 0;
int modo = 0;
boolean song = true;
float input[] = new float[4];
float[] u = new float[3];
PFont mono;

void setup(){
  size(800, 600);
  mono = createFont("Impact", 32);
}

void draw(){
  background(0);
  t = cristal(100, 100, 1, 0, t);
  /*
  pushMatrix();
  translate(width/2, -x+3*height/2);
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
  text("Al equipo del videojuego Terraria, que fueron los creadores originales de las 2 anteriores composiciones", 0, 330);
  text("A Geoffrey Lee creador de la fuente IMPACT, usada en este proyecto", 0, 390);
  text("A Microsoft, creadores de Paint, única aplicación de edición utilizada además de Processing", 0, 450);
  popMatrix();
  x++;
  */
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
