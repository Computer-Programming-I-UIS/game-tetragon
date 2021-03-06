//Funciones variadas necesarias para diferentes momentos en el juego
void stages(){ //Función que determina las plataformas de cada nivel
  Plataformas.clear();
  
  Plataformas.add(new Plataforma( width-20, 0, 20, height+5, 1, grilla,0,80,115));
  Plataformas.add(new Plataforma( 0, 0, 20, height+5, 1, grilla,0,80,115));
  
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
      
    case 1: //Apenas sube
    
      Plataformas.add(new Plataforma( 250, height-200, 30 , 200 ,3 ,grilla,0,0,0));
      Plataformas.add(new Plataforma( 250 + 40,height-150,100,50,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( width-70,height-200,50,200,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( width-70,70,50,height-350-20,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( 250,0,width-510,100,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( 250,100,width-560,90,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( 250,190,width-510,100,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( width-70,0,50,60,3,grilla,0,0,0));
      crear = 0;
      break;
    case 2: //Sube parte 2
      
      Plataformas.add(new Plataforma( width-70,height-60,50,60,3,grilla,0,0,0));
      Plataformas.add(new Plataforma( 450,height-50,200,50,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( width-80,height/2+150,60,30,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( width-80,0,60,height/2+150-100,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( width/2-40,0,50,height/2-100,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( width/2-40,height/2,50,30,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( 80,150,50,20,1,grilla,30,187,215));
      Plataformas.add(new Plataforma( 80,0, 50 ,80,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( 20,0,60,152,3,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( 250,height-50,200,60,4,grilla,30,187,215));
      Plataformas.add(new Plataforma( 250,height,200,60,1,grilla,0,0,0));
      crear = 0;
      break;
    case 3:
      Plataformas.add(new Plataforma(20, height-40,60,40,3,grilla,30,187,215)); //Entrada
      Plataformas.add(new Plataforma(80, height-30,80,50,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma( width/2-60,height-40,50,60,4,grilla,30,187,215)); //Pico mitad
      Plataformas.add(new Plataforma( width/2,height-40,60,60,5,grilla,30,187,215));
      Plataformas.add(new Plataforma( width/2-10,height-40,10,60,1,grilla,30,187,215));
      
      Plataformas.add(new Plataforma(20, height-160,160,20,1,grilla,30,187,215));//Encima de la entrada
      Plataformas.add(new Plataforma(20,height-200,160,40,5,grilla,30,187,215));
      
      Plataformas.add(new Plataforma(width-200,height/2+180,180,20,1,grilla,30,187,215)); //Derecha
      Plataformas.add(new Plataforma(width-100,height/2+100,80,80,4,grilla,30,187,215));
      Plataformas.add(new Plataforma(width-100,height/2+200,80,200,1,grilla,30,187,215)); //Pico derecha
      
      Plataformas.add(new Plataforma(width/2-25,150,50,30,1,grilla,30,187,215));
      Plataformas.add(new Plataforma(width/2-25,0,50,150,3,grilla,10,187,215));
      crear = 0;
      break;
    case 4:
      Plataformas.add(new Plataforma(width/2-25,height-50,50,50,3,grilla,1,187,215));
      Plataformas.add(new Plataforma(width/2-75,height-20,50,20,1,grilla,30,187,215));
      Plataformas.add(new Plataforma(width/2-55,height-150,100,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(width/2-55,height-250,50,100,4,grilla,1,187,215));
      Plataformas.add(new Plataforma(width/2-5,height-250,50,100,5,grilla,1,187,215));
      Plataformas.add(new Plataforma(20,height-150,50,25,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(20,height-230,50,25,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(20,height-255,50,25,5,grilla,1,187,215));
      Plataformas.add(new Plataforma(width-70,height/2-50,50,25,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(width-70,height/2-130,50,25,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(width-70,height/2-155,50,25,4,grilla,1,187,215));
      Plataformas.add(new Plataforma(20,0,50,75,3,grilla,1,187,215));
      crear = 0;
      break;
    case 5:
      Plataformas.add(new Plataforma(20,height-50,50,50,3,grilla,15,255,125));
      Plataformas.add(new Plataforma(70,height-50,40,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(180,height-50,width-200,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(220,height-100,100,50,4,grilla,1,187,215));
      Plataformas.add(new Plataforma(320,height-100,width-340,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(360,height-150,100,50,4,grilla,1,187,215));
      Plataformas.add(new Plataforma(460,height-150,width-480,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(500,height-200,100,50,4,grilla,1,187,215));
      Plataformas.add(new Plataforma(600,height-200,width-620,50,1,grilla,1,187,215));
      Plataformas.add(new Plataforma(110,height-200,150,50,1,grilla,1,187,215));
      crear = 0;
      break;
  }
}

/*_________________________________________________________________________________________________________________________________________*/

int salir(){ //Mensaje antes de salir
  background(0);
  textFont(mono);
  textSize(25);
  fill(133,133,133);
  text("Seguro que deseas " + aviso,width/2,height/2);
  text("(Y)/(N)",width/2,height/2 + 100);
    if(key == 'y' || key == 'Y'){
        t[0] = 0;
        t[1] = 0;
        t[2] = 0;
        t[3] = 0;
        modo = 0;
        key = 0;
      if(lmenu == 0){
        return aviso.equals("salir del juego?") ? -3:1;
      }else if(lmenu == 1){
        return aviso.equals("salir del juego?") ? -3:0;
      }
    }
    else if(key == 'n' || key == 'N'){
      if(modo <= 0 && t[2] <= 0 && t[1] <= 0 && lmenu == 0)
      return 0;
      else if((modo > 0 || t[2] > 0 || t[1] > 0) && lmenu == 0)
      return -1;
      else if(lmenu == 1)
      return 1;
    }
  return -2;
}

/*_________________________________________________________________________________________________________________________________________*/

float cristal(float x, float y, float s, float ang, float var){ //Cristal para decoración
  pushMatrix();
  noStroke();
  translate(x, y);
  scale(s);
  rotate(ang);
  fill(#85FF15, 200+70*sin(var/30));
  beginShape();
  vertex(0, 0);
  vertex(15, -30);
  vertex(30, 0);
  vertex(40, -10);
  vertex(30, 20);
  vertex(40, 10);
  vertex(30, 40);
  vertex(0, 40);
  vertex(-20, 20);
  vertex(-10, 20);
  vertex(-15, 10);
  vertex(-20, -10);
  vertex(0,0);
  endShape();
  popMatrix();
  var += 0.3;
  return var;
}

/*_________________________________________________________________________________________________________________________________________*/

float lucesFondo(float t){ //Función que genera unos puntos con posición aleatoria en el fondo
  noStroke();
  for(int i = 0; i <= 9; i++){
    fill(255, abs(200*sin(PI*t/100)));
    if(t%100 == 0){
      r[i][0] = random(i*width/10, (i+1)*width/10);
      r[i][1] = random(50, height-50);
    }
    pushMatrix();
    translate(r[i][0], r[i][1]);
    scale(0.5);
    beginShape();
    vertex(0,0);
    vertex(5, -10);
    vertex(10, 0);
    vertex(20, 5);
    vertex(10, 10);
    vertex(5, 20);
    vertex(0, 10);
    vertex(-10, 5);
    vertex(0, 0);
    endShape();
    popMatrix();
  }
  t++;
  return t;
}
