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

float cristal(float x, float y, float s, float ang, float var){
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
