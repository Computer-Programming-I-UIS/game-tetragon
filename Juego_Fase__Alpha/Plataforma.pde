class Plataforma{ 
  float x,var = 0;
  float y;
  int a,rsz=1;
  int l;
  int t;
  float grilla[][];
  PImage sprite;
  float r,g,b;
  PVector d,c,e;
  
  Plataforma(float posX, float posY, int ancho, int largo, int tipo, float tempgrilla[][],float tr,float tg, float tb){
    x = posX;
    y = posY;
    a = ancho;
    l = largo;
    t = tipo;
    var = 1;
    grilla = tempgrilla;
    r = tr; g = tg; b = tb; //Colores
  }
  
  void sprite() {
      
      genhitbox(x, y, a, l, t, grilla);
      
      switch(t){
        case 1:
          var = imgPlat(x,y,a,l,var,r,g,b); //Si es 1, es una plataforma sólida
          break;
        case 3:
          var = flechas(x,y,a,l,var); // Si es 3, será una escalera
        break;
        case 4:
          var = imgRamp(x,y,a,l,var,r,g,b,4);
        break;
        case 5:
          var = imgRamp(x,y,a,l,var,r,g,b,5);
          break;
        
    }
      
  }

}

/*_________________________________________________________________________________________________________________________________________*/

float flechas(float x, float y, float a, float l, float var){ 
  //"x", "y" son la posición, "a" el ancho, "l" el largo y "var" sirve para que se actualice continuamente.
  for(int i = 1; i <= l/10; i++){
    if((var+i)%20 == 0){
      fill(0, 255, 255);
    }else{
      fill(50, 50, 150);
    }
    pushMatrix();
    translate(x, y+10*i);
    beginShape();
    vertex(0, 0);
    vertex(a/2, -20);
    vertex(a, 0);
    vertex(9*a/10, 0);
    vertex(a/2, -10);
    vertex(a/10, 0);
    endShape();
    popMatrix();
  }
  var++;
  return var;
}

/*_________________________________________________________________________________________________________________________________________*/

float imgPlat(float x, float y, float a, float l, float var, float r, float g, float b){
  //"x", "y" posición, "a","l" ancho y largo, "var" variable para que se actualice, y "r","g","b" determinan el color
  noStroke();
  rectMode(CORNER);
  fill(r, g, b, 200+70*sin(var/25));
  rect(x, y, a, l);
  fill(0);
  rect(x+5, y+5, a-10, l-10); 
  var++;
  return var;
}

float imgRamp(float x, float y, float a, float l, float var, float r, float g, float b,int t){
  //"x", "y" posición, "a","l" ancho y largo, "var" variable para que se actualice, y "r","g","b" determinan el color
  noStroke();
  rectMode(CORNER);
  fill(r, g, b, 200+70*sin(var/25));
  if(t == 4){
    triangle(x,y+l,x+a,y+l,x+a,y);
    fill(0);
    triangle(x+5,y+l,x+a,y+l,x+a,y+5);
  }
  else{
    triangle(x, y, x, y+l, x+a, y+l);
    fill(0);
    triangle(x, y+5, x, y+l, x+a-5, y+l);
  }
  var++;
  return var;
}
