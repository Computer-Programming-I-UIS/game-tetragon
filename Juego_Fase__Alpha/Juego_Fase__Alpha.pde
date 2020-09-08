import processing.sound.*; //Importamos la librería de Sonidos
Jugador tetra; 
Cubichoque cubo;
ArrayList<Plataforma> Plataformas = new ArrayList<Plataforma>(); //Arraylist de plataformas a utilzar en cada fase
float grilla[][] = new float[1250][1250]; //Grilla que representa el hitbox
float a = 10, l = 10, tim, ang, lon;
float[] t = new float[10]; //Variables cambiantes del menú
float[] u = new float[10]; //Colores aleatorios del menú
float[][] r = new float[10][2]; //Array de las luces de la función lucesFondo
PVector jpos,jvel,cvel,jpos2;
int stage = 3,crear = 1,menu = 0,lmenu = 0, modo = 2;
PFont mono;
String aviso = " ";
PImage Modos; //Imagen de guía de controles
SoundFile Salto, Teleport, Apuntar, Level_1, MenuSong;
Plataforma plat1;

/*_________________________________________________________________________________________________________________________________________*/

void setup(){ 
  size(750, 600);
  frameRate(60);
  cubo = new Cubichoque();
  tetra = new Jugador(width/2, 100, grilla);
  mono = createFont("Impact", 32); //Fuente utilizada
  /*Salto = new SoundFile(this, "jump.wav"); //Inicializar los audios
  Teleport = new SoundFile(this, "teleport.wav");
  Apuntar = new SoundFile(this, "aim.wav");
  Level_1 = new SoundFile(this, "Level_1.mp3");
  MenuSong = new SoundFile(this, "MenuSong.mp3");
  Modos = loadImage("Modos.png");*/
}

/*_________________________________________________________________________________________________________________________________________*/

void draw(){
  switch(menu){
    case 1:
      /*if(!Level_1.isPlaying()){Level_1.play(1); Level_1.amp(0.075);}//La canción suena una y otra vez si nos encontramos en el juego
      if(MenuSong.isPlaying()){MenuSong.stop();} *///Si pasamos al juego, la canción del menú termina
      lmenu = menu;
      if(crear == 1){
        stages();
      }
      rectMode(CORNER);
      noStroke();
      background(0);
      gengrilla(grilla); //Generar la grilla
      
      t[1] = lucesFondo(t[1]); 
      switch (stage){ //Decoración
        case 0:
        t[0] = cristal(120, 290, 1, 0, t[0]);
        t[0] = cristal(width/2+20, height-49, 0.7, 0, t[0]);
        t[0] = cristal(width-40, 100, 0.5, 3*PI/2, t[0]);
        break;
        case 1:
        t[0] = cristal(width/2-15, 418, 0.8, 0, t[0]);
        t[0] = cristal(250-15,125,0.5,3*PI/2,t[0]);
        t[0] = cristal(30,height/2-10,1,PI/2,t[0]);
        break;
        case 2:
        t[0] = cristal(width/2-20,height/2-25,0.7,0,t[0]);
        t[0] = cristal(width/2+130,height-80,1,0,t[0]);
        break;
      }
      
      if(jpos.y < 0){ //Si se sale de la pantalla, cambiará la stage
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
      
      fill(255);
      break;    
    case 0:
    case -1:
      lmenu = 0;
      background(0);
      /*if(!MenuSong.isPlaying()){MenuSong.play(1);MenuSong.amp(0.075);}//La canción suena una y otra vez si nos encontramos en el menú
      if(Level_1.isPlaying()){Level_1.stop();}*/
      //else if(modo != 0){MenuSong.stop();}
      t = menu(t[0], t[1], t[2], t[3]); //Función menú
      if((key == 's'||key == 'S') && menu == -1 && modo >= 0){menu = -2;aviso = "saltarte el inicio?";}
      break;
    case -2:
      menu = salir();  
      break;
    case -3:
      exit();
      break;
  }
}

/*_________________________________________________________________________________________________________________________________________*/

void keyPressed(){
  tetra.movimiento();
  if((key == 'r' || key == 'R') && (cubo.salt == 1 || cubo.salt == 2)){cubo.salt--;}
  if(key == ENTER && menu == 0){menu = -1;} //Pausa
  if(key == 'c' && menu == 0 && t[3] == 0 && modo == 0){menu = -1; modo = -2;} //Activar créditos
  if((key == ESC)){
    key = 0;
    menu = -2; 
    if(lmenu == 0)
    aviso = "salir del juego?";
    else if (lmenu == 1)
    aviso = "salir al menú?";
  }
}

/*_________________________________________________________________________________________________________________________________________*/

void keyReleased(){
  tetra.estatico();
}

/*_________________________________________________________________________________________________________________________________________*/

void mousePressed(){
  if(menu == 1){
  switch(cubo.salt){ //Para que cambie el modo 
    case 0: cubo.salt = 1; /*Apuntar.amp(0.05);Apuntar.play(2);*/break; //Pasar a apuntar
    case 1: cubo.salt = 2;break; //Pasar a calcular fuerza
    case 2: cubo.salt = 3;break; //En este momento, se el bloque se encuentra viajando
  }  
}
}
