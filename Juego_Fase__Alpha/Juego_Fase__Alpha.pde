Jugador tetra;
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>();
float grilla[][] = new float[1250][1250];
float a = 10, l = 10, tim, ang, lon;
int modo = 0;
float[] t = new float[3];
float[] u = new float[3];
PVector jpos,jvel,cvel,jpos2;
int stage = 0,crear = 1,menu = 0;
PFont mono;
Plataforma plat1;

void setup(){ 
  size(750, 600);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(width/2, 400, grilla);
  mono = createFont("Impact", 32);
  cubo.salt = 0;
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
    
    if(jpos.y < 0){
      crear = 1;
      stage++;
      stages();
      jpos.y = height-tetra.l-10;
    }
    else if(jpos.y+tetra.l > height){
      crear = 1;
      stage--;
      stages();
      jpos.y = 10;
    }
    
    break;
    
    
    case 0:
    background(0);
    t = menu(t[0], t[1], t[2]);
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
Plataformas.clear();
  
  Plataformas.add(new Plataforma( width-20, 0, 20, height, 1, grilla));
  Plataformas.add(new Plataforma( 0, 0, 20, height, 1, grilla));
  
   //Limites
  switch(stage){
    
    case 0: //Tutorial
      Plataformas.add(new Plataforma( 0, height-20, width, 100, 1, grilla));
      Plataformas.add(new Plataforma( 0, height-300, 220,300,1,grilla));
      Plataformas.add(new Plataforma( width-220, height-300, 220,300,1,grilla));
      Plataformas.add(new Plataforma( 300, 100, 100, 50, 1 ,grilla));
      Plataformas.add(new Plataforma( 370, 0 , 30, 100, 3 ,grilla));
      
      crear = 0;
      break;
      
    case 1:
      Plataformas.add(new Plataforma( 370, height-100, 30 , 100 ,3 ,grilla));
      
      
      crear = 0;
      break;
    case 2:
      Plataformas.clear();
      break;
  }
}
