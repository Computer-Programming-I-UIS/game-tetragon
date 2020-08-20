Jugador tetra;
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>();
float grilla[][] = new float[1250][1250];
float a = 10, l = 10,t,d;
float[] u = new float[3];
PVector jpos,jvel,cvel,jpos2;
int stage = 1,crear = 1,menu = 1;
PFont mono;
Plataforma plat1;

void setup(){ 
  size(750, 800);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(400, 100, grilla);
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
      Plataformas.add(new Plataforma( width-20, 0, 20, height, 1, grilla));
      Plataformas.add(new Plataforma( 0, 0, 20, height, 1, grilla));
      Plataformas.add(new Plataforma( 0, 0, width-20, 20, 1, grilla));
      Plataformas.add(new Plataforma( 0, height-20, width, 100, 1, grilla));
      Plataformas.add(new Plataforma( 100, 700, 30, 99, 3, grilla));
      Plataformas.add(new Plataforma( 400, 500, 100, 50, 1, grilla));
      Plataformas.add(new Plataforma( 520, 400, 50, 100,1,grilla));
      crear = 0;
      break;
    case 2:
      Plataformas.clear();
      break;
  }
}
