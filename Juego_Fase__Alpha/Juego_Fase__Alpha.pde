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
PImage Modos;
SoundFile Salto, Teleport, Apuntar, Level_1, MenuSong;
Plataforma plat1;

void setup(){ 
  size(750, 600);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(width/2, height-100, grilla);
  mono = createFont("Impact", 32); //Fuente utilizada
  Salto = new SoundFile(this, "jump.wav"); //Inicializar los audios
  Teleport = new SoundFile(this, "teleport.wav");
  Apuntar = new SoundFile(this, "aim.wav");
  Level_1 = new SoundFile(this, "Level_1.mp3");
  MenuSong = new SoundFile(this, "MenuSong.mp3");
  Modos = loadImage("Modos.png");
}

void draw(){
  
  switch(menu){
    case 1:
      if(!Level_1.isPlaying()){Level_1.play(1); Level_1.amp(0.075);}
      if(MenuSong.isPlaying()){MenuSong.stop();}
      lmenu = menu;
      if(crear == 1){
        stages();
      }
      rectMode(CORNER);
      noStroke();
      background(0);
      gengrilla(grilla);
      switch (stage){
        case 0:
        t[0] = cristal(120, 290, 1, 0, t[0]);
        t[0] = cristal(width/2+20, height-49, 0.7, 0, t[0]);
        t[0] = cristal(width-40, 100, 0.5, 3*PI/2, t[0]);
        break;
        case 1:
        t[0] = cristal(width/2-15, 518, 0.8, 0, t[0]);
        t[0] = cristal(250-15,125,0.5,3*PI/2,t[0]);
        t[0] = cristal(30,height/2-10,1,PI/2,t[0]);
        break;
        case 2:
        t[0] = cristal(width/2-20,height/2-30,0.7,0,t[0]);
        t[0] = cristal(width/2+30,height-80,1,0,t[0]);
        break;
      }
      
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
    case -1:
      background(0);
      if(!MenuSong.isPlaying()){MenuSong.play(1);MenuSong.amp(0.075);}
      else if(modo != 0){MenuSong.stop();}
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
  //if((key == 'r' || key == 'R') && cubo.salt == 2){cubo.salt = 1;}
  if(key == ENTER && menu == 0){menu = -1;}
  if((key == ESC)){key = 0;menu = -2; aviso = "salir del juego?";}
}

void keyReleased(){
  tetra.estatico();
}

void mousePressed(){
  if(menu == 1)
  switch(cubo.salt){ //Para que cambie el modo 
    case 0: cubo.salt = 1; Apuntar.amp(0.05);Apuntar.play(2);break; //Pasar a apuntar
    case 1: cubo.salt = 2;break; //Pasar a calcular fuerza
    case 2: cubo.salt = 3;break; //En este momento, se el bloque se encuentra viajando
  }
}
