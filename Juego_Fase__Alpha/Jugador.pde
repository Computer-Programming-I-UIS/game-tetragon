class Jugador{
  
  float a = 30;
  float l = 30;
  float grilla[][];
  float salto = 1;
  char input[] = new char[5];
  
  
  Jugador(float posX, float posY, float tempgrilla[][]){ //Declarar variables
    jpos = new PVector(posX,posY);
    jvel = new PVector(0,0);
    grilla = tempgrilla;
  }
  
  void posicion() {
    //MOVIMIENTO PROVOCADO AL NO PRESIONAR TECLAS
    if(jvel.x > 0.25 && input[1] == 0){ //Aplicar una fricción para que se detenga 
      jvel.x -= 0.25;
    }else if(jvel.x < -0.25 && input[2] == 0){//Lo mismo de antes pero si se mueve en la otra dirección
      jvel.x += 0.25; 
    }else if(input[1] == 0 && input[2] == 0){//Cuando la velocidad es pequeña simplemente se detiene
      jvel.x = 0;
    }if(!vehit(jpos.x, jpos.y+l, a, 0, 1, grilla)){//Gravedad
      jvel.y += 0.3;
    }
    if(vehit(jpos.x+jvel.x, jpos.y+5*l/6, a, l/6, 1, grilla) && !vehit(jpos.x+jvel.x, jpos.y-1, a, 5*l/6, 1, grilla)){ 
      //Cuando hay una "rampa", el objeto sube
      jpos.y -= 5;
    }
    //MOVIMIENTO PROVOCADO POR EL USUARIO
    if(cubo.salt == 0){ //Solo cuando el cubo lo acompaña
      if(salto == 0 && vehit(jpos.x, jpos.y+l+jvel.y, a, 0, 1, grilla) && input[0] == 'f'){  //Si está presionada "." saltamos
        jvel.y = -6.5;
        salto = 1;
      }if(jvel.x < 4.5 && input[1] == 'd'){ //Si está presionada "d" nos movemos a la derecha
        jvel.x += 0.2;
      }if(jvel.x > -4.5 && input[2] == 'a'){ //Si está presionada "a" nos movemos a la izquierda
        jvel.x -= 0.2;
      }if(input[3] == 'w' && vehit(jpos.x, jpos.y-1, a, l+2, 3, grilla)){
        jvel.y = -1;
      }
    }
    //LIMITACIONES AL HABER UN CHOQUE DE HITBOX
    if(vehit(jpos.x+jvel.x, jpos.y-1, a, 5*l/6, 1, grilla) && jvel.x != 0){
      //Evitar movimiento cerca de paredes
      jvel.x = 0;
    }if(vehit(jpos.x, jpos.y+jvel.y, a, 0, 1, grilla)){ //Chocar contra un "techo"
      jvel.y = 0;
    }if(vehit(jpos.x, jpos.y+l+jvel.y, a, 0, 1, grilla)) { //Chocar contra un "piso"
      jvel.y = 0;
      if(input[0] == 0) //Que pueda volver a saltar después de soltar la tecla respectiva
      salto = 0;
    }//MODIFICAR LA POSICIÓN SEGÚN LA VELOCIDAD
    jpos.x += jvel.x;
    jpos.y += jvel.y;
    
  }
  
  void movimiento() { //Indicar que una tecla fue presionada
    if(key == 'f' || key == 'F'){
      input[0] = 'f';
    }if(key == 'd' || key == 'D'){
      input[1] = 'd';
    }if(key == 'a' || key == 'A'){
      input[2] = 'a';
    }if(key == 'w' || key == 'W'){
      input[3] = 'w';
    }
  }
  void estatico() { //Indicar que una tecla fue dejada de ser presionada
    if(key == 'f' || key == 'F'){
      input[0] = 0;
    }if(key == 'd' || key == 'D'){
      input[1] = 0;
    }if(key == 'a' || key == 'A'){
      input[2] = 0;
    }if(key == 'w' || key == 'W'){
      input[3] = 0;
    }
  }
  void sprite() {
    fill(255, 0, 0);
    rect(jpos.x, jpos.y, a, l);
    fill(-1);
    genhitbox(jpos.x, jpos.y, a, l, 2, grilla);
  }
}
