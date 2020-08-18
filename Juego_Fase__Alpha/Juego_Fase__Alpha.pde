Jugador tetra;
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>();
Plataforma prueba;
Plataforma esc1;
Plataforma lim_der;
Plataforma lim_izq;
Plataforma lim_sup;
Plataforma lim_inf;
float grilla[][] = new float[850+51][900+51];
float a = 10, l = 10;
PVector jpos,jvel,cvel;

void setup(){
  size(750, 800);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(475, 400, grilla);
  Plataformas.add(new Plataforma( width-10, 0, 10, height, 1, grilla));
  Plataformas.add(new Plataforma( 0, 0, 10, height, 1, grilla));
  Plataformas.add(new Plataforma( 0, 0, width-10, 10, 1, grilla));
  Plataformas.add(new Plataforma( 0, height-10, width, 25, 1, grilla));
  Plataformas.add(new Plataforma( 100, 700, 30, 100, 3, grilla));
  Plataformas.add(new Plataforma ( 400, 500, 100, 50, 1, grilla));
}

void draw(){
  rectMode(CORNER);
  noStroke();
  background(-1);
  gengrilla(grilla);
  Plataforma plat1;
  for(int i = 0;i < Plataformas.size();i++){
    plat1 = Plataformas.get(i);
    plat1.sprite();
    esc1.sprite();
    prueba.sprite();
  }
  tetra.sprite();
  tetra.posicion();
  cubo.dibujar();
  cubo.disp();
  
}

void keyPressed(){
  tetra.movimiento();
}

void keyReleased(){
  tetra.estatico();
}

void mousePressed(){
  switch(cubo.salt){ //Pa que cambie pues
    case 0: cubo.salt = 1;break;
    case 1: cubo.salt = 2;break;
    case 2: cubo.salt = 0;break;
  }
}
