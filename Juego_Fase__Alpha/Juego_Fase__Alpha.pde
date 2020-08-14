Jugador tetra;
Plataforma prueba;
Plataforma esc1;
Plataforma lim_der;
Plataforma lim_izq;
Plataforma lim_sup;
Plataforma lim_inf;
float grilla[][] = new float[750+51][800+51];
float x = 0,y = 0, a = 10, l = 10,t = 0;

void setup(){
  size(750, 800);
  frameRate(60);
  tetra = new Jugador(600, 600, grilla);
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
  tetra.sprite();
  if(mouseX > 30 && mouseX < width-30 && mouseY > 30 && mouseY <height+10){
    t = Quadrangle(t, tetra.x, tetra.y-5);
  }
  tetra.posicion();
}

void keyPressed(){
  tetra.movimiento();
}

void keyReleased(){
  tetra.estatico();
}
