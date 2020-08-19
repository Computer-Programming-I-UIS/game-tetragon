Jugador tetra;
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>();
float grilla[][] = new float[850+101][900+101];
float a = 10, l = 10,t,d;
float[] u = new float[3];
PVector jpos,jvel,cvel;
int stage = 1,crear = 1,menu = 0;
PFont mono;

void setup(){
  size(750, 800);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(475, 400, grilla);
  mono = createFont("Impact", 32);
}

void draw(){
  switch(menu){
    case 1:
    if(crear == 1){
      stages();
    }
    rectMode(CORNER);
    noStroke();
    background(-1);
    gengrilla(grilla);
    
    Plataforma plat1;
    for(int i = 0;i < Plataformas.size();i++){
      plat1 = Plataformas.get(i);
      plat1.sprite();
    }
    tetra.sprite();
    tetra.posicion();
    cubo.dibujar();
    cubo.disp();
    break;
    
    case 0:
    background(0);
    t = menu(t);
    break;
  }
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
  }
}

void stages(){
  switch(stage){
    case 1:
    Plataformas.add(new Plataforma( width-10, 0, 10, height, 1, grilla));
    Plataformas.add(new Plataforma( 0, 0, 10, height, 1, grilla));
    Plataformas.add(new Plataforma( 0, 0, width-10, 10, 1, grilla));
    Plataformas.add(new Plataforma( 0, height-10, width, 25, 1, grilla));
    Plataformas.add(new Plataforma( 100, 700, 30, 100, 3, grilla));
    Plataformas.add(new Plataforma ( 400, 500, 100, 50, 1, grilla));
    crear = 0;
    break;
  }
}
