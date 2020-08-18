class Cubichoque{
  float rot,rx,ry;
  PVector cpos;
  int salt = 0,estat = 0; /*Salt = 0 => Con el jugador 
                          Salt = 1 => Apuntando 
                          Salt = 2 => Disparado el cubo
                          Estat es para que solo halla un choque*/
  Cubichoque(){
    cvel = new PVector(0,0); //Velocidad
    cpos = new PVector(width/2,height/2); //Posicion normal del bichi
  }
  
  void dibujar(){ //Hace todo lol
    
    if(salt == 1){ //Cuando se esta puntando
      
      rot += 0.1;
      pushMatrix();
      translate(jpos.x+tetra.a/2,jpos.y+tetra.l/2); //Rotacion alrededor del jugador
      rotate(rot);
      noStroke();
      
      rx = screenX(cpos.x*0.05,cpos.y*0.05);
      ry = screenY(cpos.x*0.05,cpos.y*0.05); //Dan las coordenadas sin importar hasta donde rotó, pero son giganormes Xd
      
      fill(25, 25 ,200);
      rect(cpos.x*0.05,cpos.y*0.05, 2*a, 2*l);
      fill(250, 250, 0);
      rect(cpos.x*0.05+a/2,cpos.y*0.05+l/2, a/2, l/2);
      
      popMatrix();
     
    }
    
    else if (salt == 0){ //Acompañando al jugador, ta rotating todo creisi
      rot+= 0.2;
      cpos.x += (jpos.x-a-cpos.x)/10;
      cpos.y += (jpos.y-a-cpos.y)/10+sin(rot/6);
      pushMatrix();
      translate(cpos.x, cpos.y);
      rotate(rot);
      
      rx = screenX(cpos.x*0.05,cpos.y*0.05); //Tambien se actualiza acá just in case
      ry = screenY(cpos.x*0.05,cpos.y*0.05);
      
      noStroke();
      fill(25, 25 ,200);
      rect(-a, -l, 2*a, 2*l);
      fill(250, 250, 0);
      rect(-a/4, -l/4, a/2, l/2);
      popMatrix();
    }
    
    else if(salt == 2){ //Cuando esta viajando
      
      rectMode(CENTER);
      noStroke();
      fill(25, 25 ,200);
      rect(rx,ry,20,20);
      fill(250, 250, 0);
      rect(rx,ry,5,5);
      
    }
    
  }
  void disp(){
         
    genhitbox(rx,ry,20,20,2,grilla);
    
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
      rx+= 4*cvel.x;
      ry+= 3*cvel.y;
      
      if((rx > width || rx < 0)||(ry > height || ry < 0)){ //Para que no este OoB, vuelve al modo apuntar
        salt = 1;
      }
      
    }

    if(vehit(rx+4*cvel.x,ry+4*cvel.y,20,5*20/6,1,grilla) && salt == 2){ //Cuando se choca se detiene 
      cvel.y = 0;
      cvel.x = 0;
      estat = 1;
    }
    
    if(estat == 1){ //Cuando termine el movimiento y confirmadisimo que chocó se tpea el jugador
     if(rx > width/2){ //Condiciones pa que no se salga del mapa Xd
       jpos.x = rx-10;
     }
     else if(rx < width/2){
       jpos.x = rx+10;
     }
     if(ry > height/2){
       jpos.y = ry-10;
     }
     else if(ry < height/2){
       jpos.y = ry+10;
     }
     estat = 0; 
     salt = 0;
    }
  }
}
