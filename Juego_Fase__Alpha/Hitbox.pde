//FUNCIONES IMPORTANTES PARA EL HITBOX
void gengrilla(float grilla[][]){ //Generar la grilla
  for(int i = 0; i <= width+100; i++){
    for(int j = 0; j <= height+100; j++){
      grilla[i][j] = 0;
    }
  }
}

/*_________________________________________________________________________________________________________________________________________*/

void genhitbox(float x,float y,float a,float l,int t, float grilla[][]){ //Cambiar el valor de la grilla a algún valor en específico según la naturaleza del objeto
  if(x+a < width+100 && x > -100 && y+l < height + 100 && y > -100){
    for(int i = abs(round(x)); i <= abs(round(x+a)); i++){
      for(int j = abs(round(y)); j <= abs(round(y+l)); j++){
        if(t == 4 || t == 5){}
        else{grilla[i][j] = t;}
        //Determinar valor de la grilla en esa zona
        // t = 0 => Espacio vacío
        // t = 1 => Pared
        // t = 2 => Jugador
        // t = 3 => Escalera
      }
    }
    
  }
  
}

/*_________________________________________________________________________________________________________________________________________*/

boolean vehit(float x,float y,float a,float l,float t, float grilla[][]){ //Verificar hitbox en una zona
  boolean check = false;
  if(x+a < width+100 && x > -100 && y+l < height + 100 && y > -100){
    for(int i = abs(round(x)); i <= abs(round(x+a)); i++){
      
        for(int j = abs(round(y)); j <= abs(round(y+l)); j++){
          if(grilla[i][j] == t){ //Si encuentra alguno con el valor requerido, se devuelve el valor true
            check = true;
            break;
          }
        }
      
    }
  }
  return check;
}

/*boolean hitboxtriang(float x,float y,int i,int j,float an, float l, int t){
   PVector c = new PVector(x,y+l);
   PVector d = new PVector(x+an,y+l);
   PVector e = new PVector(x+an,y);
   PVector p = new PVector(i,j); 
    switch(t){
     default:
     break;
     case 5:
       c.x = x;
       c.y = y;
       d.x = x;
       d.y = y+l;
       e.x = x+an;
       e.y = y+l;
       break;
    }
   
   float area1 = c.copy().sub(d).cross(p.copy().sub(d)).mag(); 
   float area2 = e.copy().sub(c).cross(p.copy().sub(c)).mag();
   float area3 = d.copy().sub(e).cross(p.copy().sub(e)).mag();
   float areat = c.copy().sub(d).cross(e.copy().sub(c)).mag();
   
   if(area1+area2+area3-areat == 0){return true;}
   return false;
}*/
