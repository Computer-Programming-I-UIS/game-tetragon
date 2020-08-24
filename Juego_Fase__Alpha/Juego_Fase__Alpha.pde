import processing.sound.*; //Importamos la librería de Sonidos
Jugador tetra; 
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>(); //Arraylist de plataformas a utilzar en cada fase
float grilla[][] = new float[1250][1250]; //Grilla que representa el hitbox
float a = 10, l = 10, tim, ang, lon;
float[] t = new float[3];
float[] u = new float[3];
PVector jpos,jvel,cvel,jpos2;
int stage = 0,crear = 1,menu = 0,lmenu = 0, modo = 0;
PFont mono;
String aviso = " ";
SoundFile Salto, Teleport, Apuntar, Level_1, MenuSong;
Plataforma plat1;

void setup(){ 
  size(750, 600);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(width/2, height-250, grilla);
  mono = createFont("Impact", 32); //Fuente utilizada
  Salto = new SoundFile(this, "jump.wav"); //Inicializar los audios
  Teleport = new SoundFile(this, "teleport.wav");
  Apuntar = new SoundFile(this, "aim.wav");
  Level_1 = new SoundFile(this, "Level_1.mp3");
  MenuSong = new SoundFile(this, "MenuSong.mp3");
}

void draw(){
  
  switch(menu){
    case 1:
      if(!Level_1.isPlaying()){Level_1.play(1);}
      modo = 0; //Volver a cero las variables utilizadas en la cinemática
      t[0] = 0;
      t[1] = 0;
      t[2] = 0;
      lmenu = menu;
      if(crear == 1){
        stages();
      }
      rectMode(CORNER);
      noStroke();
      background(0);
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
    case -1:
      background(0);
      if(!MenuSong.isPlaying()){MenuSong.play(1);}
      t = menu(t[0], t[1], t[2]);
      if((key == 's'||key == 'S') && menu == -1){menu = -2;aviso = "saltarte el inicio?";}
      break;
    case -2:
      menu = salir();  
      break;
    case -3:
      exit();
      break;
  }
 

}

void keyPressed(){
  tetra.movimiento();
  if((key == 'r' || key == 'R') && cubo.salt == 2){cubo.salt = 1;}
  if(key == ENTER && menu == 0){menu = -1;}
  if((key == ESC)){key = 0;menu = -2; aviso = "salir del juego?";}
}

void keyReleased(){
  tetra.estatico();
}

void mousePressed(){
  if(menu == 1)
  switch(cubo.salt){ //Para que cambie el modo 
    case 0: cubo.salt = 1; Apuntar.play(2);break; //Pasar a apuntar
    case 1: cubo.salt = 2;break; //Pasar a calcular fuerza
    case 2: cubo.salt = 3;break; //En este momento, se el bloque se encuentra viajando
  }
}

void stages(){
  Plataformas.clear();
  
  Plataformas.add(new Plataforma( width-20, 0, 20, height-20, 1, grilla,0,80,115));
  Plataformas.add(new Plataforma( 0, 0, 20, height-20, 1, grilla,0,80,115));
  
   //Limites der e izq
  switch(stage){
    case -1:
      stage = 0;
      break;
    case 0: //Tutorial
      Plataformas.add(new Plataforma( 0, height-20, width, 100, 1, grilla,0,80,115)); //Lim Inf
      
      Plataformas.add(new Plataforma( 20, height-270, 220,250,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( width-220, height-250, 200,230,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( 240, 100, 280, 50, 1 ,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( 250, 0 , 30, 90, 3 ,grilla,0,0,0));
      
      crear = 0;
      break;
      
    case 1:
    
      Plataformas.add(new Plataforma( 250, height-100, 30 , 100 ,3 ,grilla,0,0,0));
      Plataformas.add(new Plataforma( 250 + 40,height-50,100,50,1,grilla,30,187,215));
      crear = 0;
      break;
    case 2:
      
      crear = 0;
      break;
  }
}

int salir(){
  background(0);
  textFont(mono);
  textSize(25);
  fill(133,133,133);
  text("Seguro que deseas " + aviso,width/2,height/2);
  text("(Y)/(N)",width/2,height/2 + 100);
    if(key == 'y' || key == 'Y'){
      return aviso.equals("salir del juego?") ? -3:1;
    }
    else if(key == 'n' || key == 'N'){
      return aviso.equals("salir del juego?") ? lmenu:-1;
    }
  return -2;
}
