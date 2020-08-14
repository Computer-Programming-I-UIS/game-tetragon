Jugador mario;
Plataforma prueba;
Plataforma esc1;
Plataforma lim_der;
Plataforma lim_izq;
Plataforma lim_sup;
Plataforma lim_inf;
float grilla[][] = new float[750+51][800+51];

void setup(){
  size(750, 800);
  frameRate(60);
  mario = new Jugador(600, 600, grilla);
  lim_der = new Plataforma( width-10, 0, 10, height, 1, grilla);
  lim_izq = new Plataforma( 0, 0, 10, height, 1, grilla);
  lim_sup = new Plataforma( 0, 0, width-10, 10, 1, grilla);
  lim_inf = new Plataforma( 0, height-10, width, 25, 1, grilla);
  esc1 = new Plataforma( 100, 700, 30, 80, 3, grilla);
}
void draw(){
  background(-1);
  gengrilla(grilla);
  lim_izq.sprite();
  lim_der.sprite();
  lim_sup.sprite();
  lim_inf.sprite();
  esc1.sprite();
  mario.sprite();
  if(mouseX > 30 && mouseX < width-30 && mouseY > 30 && mouseY <height+10){
    if(mousePressed){
      prueba = new Plataforma( mouseX-15, mouseY-15, 30, 10, 1, grilla);
      prueba.sprite();
    }
  }
  mario.posicion();
}

void keyPressed(){
  mario.movimiento();
}

void keyReleased(){
  mario.estatico();
}
