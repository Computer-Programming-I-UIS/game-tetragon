class Cubichoque{
  float rot,rx,ry,fza=50;
  PVector cpos;
  int salt = 0,estat = 0; /*Salt = 0 => Con el jugador 
                          Salt = 1 => Apuntando 
                          Salt = 2 => Disparado el cubo
                          Estat es para que solo halla un choque*/
  float yep = 0;
  char dir,dir2;
  Cubichoque(){
    cvel = new PVector(0,0); //Velocidad
    cpos = new PVector(width/2,height/2); //Posicion normal del personaje
    
    a = 20;
    l = 20;
  }
  
  void dibujar(){ //Contiene todo lo que se hace en esta clase
    
    switch(salt){ //Cuando se esta apuntando
      case 0:
       //Acompañando al jugador
      
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
        break;
      
      case 1: //Apuntando
        jvel.x = 0;
        rot += 0.075;
        pushMatrix();
        translate(jpos.x+tetra.a/2,jpos.y+tetra.l/2); //Rotacion alrededor del jugador
        rotate(rot);
        noStroke();
        
        rx = screenX(cpos.x*0.1,cpos.y*0.1);
        ry = screenY(cpos.x*0.1,cpos.y*0.1); //Dan las coordenadas sin importar hasta donde rotó, como son muy grandes, se multiplican por 0.1
        
        
        rectMode(CENTER);
        noStroke();
        pushMatrix();
        fill(25, 175 ,200);
        translate(cpos.x*0.1,cpos.y*0.1);
        rotate(PI/4);
        rect(0, 0,20,20);
        popMatrix();
        fill(25, 25 ,200);
        rect(cpos.x*0.1,cpos.y*0.1,a,a);
        fill(250, 250, 0);
        rect(cpos.x*0.1,cpos.y*0.1,a/4,a/4);
        popMatrix();
        break;
      
      case 2: //Fuerza
        yep = fza == 10 ? 1 : (fza == 50 ? -1:yep);
        fza+=yep;

        rectMode(CORNER);
        fill(200);
        rect(width/2-30,height/2-30,60,30);
        fill(188,0,0);
        rect(width/2-30+4,height/2-30+4,fza-8,30-8);
        pushMatrix();
        rectMode(CENTER);
        fill(25, 175 ,200);
        translate(rx,ry);
        rotate(PI/4);
        rect(0, 0,20,20);
        popMatrix();
        fill(25, 25 ,200);
        rect(rx,ry,a,a);
        fill(250, 250, 0);
        rect(rx,ry,a/4,a/4);
        break;
      
      case 3: //Cuando esta viajando  
      
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
        break;  
    }
    
  }
  void disp(){
   if(rx < -500 || rx > width+500 || ry > height+500 || ry < -500){salt = 1;} //Si el personaje sale del mapa
    
    switch(salt){
      case 1: //Mientras apunta
        
        float ang = 0; 
        pushMatrix();
        translate(jpos.x+15,jpos.y+15);
        ang = atan2(ry-(jpos.y+15),rx-(jpos.x+15));  //Angulo con el que va a salir disparado
        popMatrix();
        cvel.x = cos(ang);
        cvel.y = sin(ang);
        dir = cvel.x > 0 ? 'r':'l';
        dir2 = cvel.y > 0 ? 'd':'u';
        cvel.div(cvel.mag()); //Vector unitario por si acaso algo maluco pasa :u
        
        break;
    
      case 3:  
        dir = cvel.x > 0 ? 'r':'l';
        dir2 = cvel.y > 0 ? 'd':'u';
        cvel.y-=-0.01;     
        
        rx+= (fza/5)*cvel.x;
        ry+= (fza/5)*cvel.y;
        if(vehit(rx+(fza/5)*cvel.x,ry+(fza/5)*cvel.y,20,20,1,grilla)){ //Cuando se choca se detiene 
          
          cvel.y = 0;
          cvel.x = 0;
          estat = 1;
        }
        if(estat == 1){ //Cuando termine el movimiento y confirmadisimo que chocó se teletransporta el jugador
         jpos.x = (dir == 'l' ? rx+tetra.a/2+5:rx-tetra.a/2-5);
         jpos.y = dir == 'u' ? ry+tetra.l/2:ry-tetra.l/2;
         Teleport.amp(0.1);
         Teleport.play(2);
         estat = 0; 
         salt = 0;
        }
        break;
        
      case 2:
        if(((rx+a > width-a  || rx < a))){ //Para que no este OoB, vuelve al modo apuntar
            salt = 1;
          }
        for(int i = 0;i < Plataformas.size();i++){
            plat1 = Plataformas.get(i);
            if(rx+a > plat1.x && rx+a < plat1.x+plat1.a && plat1.t == 1){
              if((ry > plat1.y && ry < plat1.y+plat1.l)||(ry+l > plat1.y && ry+l < plat1.y+plat1.l)){
                salt = 1;
              }
            }
            if(rx > plat1.x && rx+a < plat1.x+plat1.a && plat1.t == 1){
              if((ry > plat1.y && ry < plat1.y+plat1.l)||(ry+l > plat1.y && ry+l < plat1.y+plat1.l)){
                salt = 1;
              }
            }
        }
        break;
        
      default:
        genhitbox(rx,ry,a,l,2,grilla);
        break;
    }
  }
}
