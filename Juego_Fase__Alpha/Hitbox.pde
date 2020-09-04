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
        if(t == 4){
          if(j >= -l/a*i+y+l*(x/a+1)){grilla[i][j] = t;}
        }else if(t == 5){
          if(j >= i){grilla[i][j] = t;}
        }else{
          grilla[i][j] = t;
        }
        //Determinar valor de la grilla en esa zona
        // t = 0 => Espacio vacío
        // t = 1 => Pared
        // t = 2 => Jugador
        // t = 3 => Escalera
        // t = 4 => Rampa I>D
        // t = 5 => Rampa I<D
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
