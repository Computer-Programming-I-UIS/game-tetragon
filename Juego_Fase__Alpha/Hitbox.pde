//FUNCIONES IMPORTANTES PARA EL HITBOX
void gengrilla(float grilla[][]){ //Generar la grilla
  for(int i = 0; i <= width+100; i++){
    for(int j = 0; j <= height+100; j++){
      grilla[i][j] = 0;
    }
  }
}

void genhitbox(float x,float y,float a,float l,float t, float grilla[][]){ //Cambiar el valor de la grilla a algún valor en específico según la naturaleza del objeto
  if(x+a < width+100 && x > -100 && y+l < height + 100 && y > -100)
  for(int i = abs(round(x)); i <= abs(round(x+a)); i++){
    for(int j = abs(round(y)); j <= abs(round(y+l)); j++){
      grilla[i][j] = t; //Determinar valor de la grilla en esa zona
      // t = 0 => Espacio vacío
      // t = 1 => Pared
      // t = 2 => Jugador
      // t = 3 => Escalera
    }
  }
}

boolean vehit(float x,float y,float a,float l,float t, float grilla[][]){ 
  boolean check = false;
  for(int i = abs(round(x)); i <= abs(round(x+a)); i++){
    for(int j = abs(round(y)); j <= abs(round(y+l)); j++){
      if(grilla[i][j] == t){
        check = true;
        break;
      }
    }
  }
  return check;
}
