class Cubichoque{
  float rot,rx,ry;
  PVector cpos;
  int salt = 0,estat = 0; /*Salt = 0 => Con el jugador 
                          Salt = 1 => Apuntando 
                          Salt = 2 => Disparado el cubo
                          Estat es para que solo halla un choque*/
  char dir,dir2;
  Cubichoque(){
    cvel = new PVector(0,0); //Velocidad
    cpos = new PVector(width/2,height/2); //Posicion normal del bichi
    a = 20;
    l = 20;
  }
  
  void dibujar(){ //Hace todo lol
    
    if(salt == 1){ //Cuando se esta apuntando
      jvel.x = 0;
      
      rot += 0.1;
      pushMatrix();
      translate(jpos.x+tetra.a/2,jpos.y+tetra.l/2); //Rotacion alrededor del jugador
      rotate(rot);
      noStroke();
      
      rx = screenX(cpos.x*0.05,cpos.y*0.05);
      ry = screenY(cpos.x*0.05,cpos.y*0.05); //Dan las coordenadas sin importar hasta donde rotó, pero son giganormes Xd
      
      rectMode(CENTER);
      
      noStroke();
      pushMatrix();
      fill(25, 175 ,200);
      translate(cpos.x*0.1,cpos.y*0.1);
      rotate(PI/4);
      rect(0, 0,20,20);
      popMatrix();
      fill(25, 25 ,200);
      rect(cpos.x*0.1,cpos.y*0.1,20,20);
      fill(250, 250, 0);
      rect(cpos.x*0.1,cpos.y*0.1,5,5);
      
      popMatrix();
     
    }
    
    else if (salt == 0){ //Acompañando al jugador, ta rotating todo creisi
      
      rot++;
      cpos.x += (jpos.x-a-cpos.x)/10;
      cpos.y += (jpos.y-a-cpos.y)/10+sin(rot/6);
      pushMatrix();
      translate(cpos.x, cpos.y);
      rotate(rot/10);
      
      rx = screenX(cpos.x*0.05,cpos.y*0.05); //Tambien se actualiza acá just in case
      ry = screenY(cpos.x*0.05,cpos.y*0.05);
      
      rectMode(CENTER);
      noStroke();
      pushMatrix();
      fill(25, 175 ,200);
      translate(cpos.x*0.005,cpos.y*.005);
      rotate(PI/4);
      rect(0, 0,20,20);
      popMatrix();
      fill(25, 25 ,200);
      rect(cpos.x*0.005,cpos.y*.005,a,l);
      fill(250, 250, 0);
      rect(cpos.x*0.005,cpos.y*.005,a/4,l/4);
      popMatrix();
    }
    
    else if(salt == 2){ //Cuando esta viajando
      
      rectMode(CENTER);
      noStroke();
      pushMatrix();
      fill(25, 175 ,200);
      translate(rx,ry);
      rotate(PI/4);
      rect(0, 0,20,20);
      popMatrix();
      fill(25, 25 ,200);
      rect(rx,ry,a,a);
      fill(250, 250, 0);
      rect(rx,ry,a/4,a/4);
      
    }
    
  }
  void disp(){
    
    if(salt==1){ //Mientras apunta
      float ang = 0; 
      pushMatrix();
      translate(jpos.x+15,jpos.y+15);
      ang = atan2(ry-(jpos.y+15),rx-(jpos.x+15));  //Angulo con el que va a salir disparado
      popMatrix();
      cvel.x = cos(ang);
      cvel.y = sin(ang);
      cvel.div(cvel.mag()); //Vector unitario por si acaso algo maluco pasa :u
      
    }
    if(salt==2){ //Mientras pega el severo viajesote  
      
      cvel.y-=-0.01;
      if(cvel.x > 0){dir = 'r';}
      else{dir = 'l';}
      if(cvel.y > 0){dir2 = 'd';}
      else{dir2 = 'u';}
      rx+= 4*cvel.x;
      ry+= 12*cvel.y;
      if(((rx+a > width-a  || rx < a /*|| ry < a-1*/))){ //Para que no este OoB, vuelve al modo apuntar
        salt = 1;
      }
      for(int i = 0;i < Plataformas.size();i++){
          plat1 = Plataformas.get(i);
          if(((rx+a < plat1.x+plat1.a && rx > plat1.x) &&
              (ry+l < plat1.y+plat1.l && ry > plat1.y)) && plat1.t == 1){
               salt = 1;
             }
          }
    }
    genhitbox(rx,ry,a,l,2,grilla);
    if(vehit(rx+4*cvel.x,ry+12*cvel.y,20,20,1,grilla) && salt == 2){ //Cuando se choca se detiene 
      cvel.y = 0;
      cvel.x = 0;
      estat = 1;
    }
    
    if(estat == 1){ //Cuando termine el movimiento y confirmadisimo que chocó se tpea el jugador
   
     if(dir == 'l'){jpos.x = rx + tetra.a/2;}
     else{jpos.x = rx - tetra.a/2;}
     if(dir2 == 'u'){jpos.y = ry + tetra.l;}
     else{jpos.y = ry - tetra.l;}

     estat = 0; 
     salt = 0;
    }
  }
}
