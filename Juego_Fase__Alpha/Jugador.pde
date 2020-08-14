class Jugador{
  float x;
  float y;
  float a = 30;
  float l = 30;
  float vx = 0;
  float vy = 0;
  float grilla[][];
  float salto = 1;
  char input[] = new char[5];
  
  Jugador(float posX, float posY, float tempgrilla[][]){ //Declarar variables
    x = posX;
    y = posY;
    grilla = tempgrilla;
  }
  
  void posicion() {
    //MOVIMIENTO PROVOCADO AL NO PRESIONAR TECLAS
    if(vx > 0.25 && input[1] == 0){ //Aplicar una fricción para que se detenga 
      vx -= 0.25;
    }else if(vx < -0.25 && input[2] == 0){//Lo mismo de antes pero si se mueve en la otra dirección
      vx += 0.25; 
    }else if(input[1] == 0 && input[2] == 0){//Cuando la velocidad es pequeña simplemente se detiene
      vx = 0;
    }if(!vehit(x, y+l, a, 0, 1, grilla)){//Gravedad
      vy += 0.3;
    }
    if(vehit(x+vx, y+5*l/6, a, l/6, 1, grilla) && !vehit(x+vx, y-1, a, 5*l/6, 1, grilla)){ 
      //Cuando hay una "rampa", el objeto sube
      y -= 5;
    }
    //MOVIMIENTO PROVOCADO POR EL USUARIO
    if(salto == 0 && vehit(x, y+l+vy, a, 0, 1, grilla) && input[0] == 'f'){  //Si está presionada "." saltamos
      vy = -6.5;
      salto = 1;
    }if(vx < 4.5 && input[1] == 'd'){ //Si está presionada "d" nos movemos a la derecha
      vx += 0.2;
    }if(vx > -4.5 && input[2] == 'a'){ //Si está presionada "a" nos movemos a la izquierda
      vx -= 0.2;
    }if(input[3] == 'w' && vehit(x, y-1, a, l+2, 3, grilla)){
      vy = -1;
    }
    //LIMITACIONES AL HABER UN CHOQUE DE HITBOX
    if(vehit(x+vx, y-1, a, 5*l/6, 1, grilla) && vx != 0){
      //Evitar movimiento cerca de paredes
      vx = 0;
    }if(vehit(x, y+vy, a, 0, 1, grilla)){ //Chocar contra un "techo"
      vy = 0;
    }if(vehit(x, y+l+vy, a, 0, 1, grilla)) { //Chocar contra un "piso"
      vy = 0;
      if(input[0] == 0) //Que pueda volver a saltar después de soltar la tecla respectiva
      salto = 0;
    }//MODIFICAR LA POSICIÓN SEGÚN LA VELOCIDAD
    x += vx;
    y += vy;
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
    rect(x, y, a, l);
    fill(-1);
    genhitbox(x, y, a, l, 2, grilla);
  }
}
