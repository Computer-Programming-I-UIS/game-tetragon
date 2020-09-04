class Jugador{
  int t = 2;
  float a = 20;
  float l = 45;
  float grilla[][];
  float salto = 1;
  float lon = sqrt(45), tim = 0, ang;
  char input[] = new char[5];
  
  
  Jugador(float posX, float posY, float tempgrilla[][]){ //Declarar variables
    jpos = new PVector(posX,posY);
    jvel = new PVector(0,0);
    grilla = tempgrilla;
  }
  
  /*_________________________________________________________________________________________________________________________________________*/
  
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
    for(int i = 0;i < Plataformas.size();i++){
      plat1 = Plataformas.get(i);
      
    }
    //MOVIMIENTO PROVOCADO POR EL USUARIO
    if(cubo.salt == 0 && (vehit(jpos.x, jpos.y+l+jvel.y, a, 0, 1, grilla) || vehit(jpos.x, jpos.y+l+jvel.y, a, l, 3, grilla))){ //Solo cuando el cubo lo acompaña
      if(salto == 0 && vehit(jpos.x, jpos.y+l+jvel.y, a, 0, 1, grilla) && input[0] == 'f'){  //Si está presionada "f" saltamos
        jvel.y = -6.5;
        salto = 1;
        /*Salto.amp(0.1);
        Salto.play(2);*/
      }if(jvel.x < 4.5 && input[1] == 'd'){ //Si está presionada "d" nos movemos a la derecha
        jvel.x += 0.2;
      }if(jvel.x > -4.5 && input[2] == 'a'){ //Si está presionada "a" nos movemos a la izquierda
        jvel.x -= 0.2;
      }if(input[3] == 'w' && vehit(jpos.x, jpos.y-1, a-2, l+2, 3, grilla)){
        jvel.y = -2.5;
      }
    }
    //LIMITACIONES AL HABER UN CHOQUE DE HITBOX
    if((vehit(jpos.x+jvel.x, jpos.y-1, a, 5*l/6, 1, grilla)||vehit(jpos.x+jvel.x, jpos.y-1, a, 5*l/6, 4, grilla)) && jvel.x != 0){
      //Evitar movimiento cerca de paredes
      jvel.x = 0;
    }if(vehit(jpos.x, jpos.y, a, jvel.y, 1, grilla)){ //Chocar contra un "techo"
      jvel.y = 0;
    }if(vehit(jpos.x, jpos.y+l+jvel.y, a, 0, 1, grilla)) { //Chocar contra un "piso"
      jvel.y = 0;
      if(input[0] == 0) //Que pueda volver a saltar después de soltar la tecla respectiva
      salto = 0;
    }
    else{
      ang = -10*PI/9;
    }
    if(vehit(jpos.x,jpos.y+l+jvel.y,2*a,0,4,grilla)){ //vehit(jpos.x+a,jpos.y+l+jvel.y,a,0,4,grilla)){
       jvel.x-=2;
    }
    if(vehit(jpos.x,jpos.y+l+jvel.y,2*a,0,5,grilla)){ 
      jvel.x+=2;
    }
    //MODIFICAR LA POSICIÓN SEGÚN LA VELOCIDAD
    jpos.x += jvel.x;
    jpos.y += jvel.y;
    
  }
  
  /*_________________________________________________________________________________________________________________________________________*/
  
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
  
  /*_________________________________________________________________________________________________________________________________________*/
  
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
  
  /*_________________________________________________________________________________________________________________________________________*/
  
  void tetra(float x, float y, float s){ 
    pushMatrix();
    translate(x, y); //Esto indica la parte superior izquierda del robot
    scale(s); //Esto indica la escala, usar 0.2 para el juego
    //Brazo Atrás:
    fill(20, 155, 20);
    pushMatrix();
    translate(2.5+pow(lon,2), 140+5*sin(tim/15+1.5));
    rotate(ang);
    rect(-7.5, 0, 15, 60);
    fill(0 , 255, 0);
    rect(-7.5, 50, 15, 10);
    popMatrix();
    //Cabeza:
    pushMatrix();
    fill(20, 155, 20);
    translate(0, 10*sin(tim/15));
    rect(0, 0, 100, 100);
    fill(0 , 255, 0);
    beginShape();
    vertex(50, 0);
    vertex(100, 50);
    vertex(50, 100);
    vertex(0, 50);
    vertex(50, 0);
    endShape();
    fill(20, 155, 20);
    ellipse(50+2*lon, 50, 10, 10);
    popMatrix();
    //Cuerpo:
    pushMatrix();
    fill(50 , 255, 50);
    translate(20, 120+5*sin(tim/15+1));
    rect(0, 0, 60, 100);
    fill(20, 155, 20);
    if(cubo.salt != 0 || input[1] == 0 && input[2] == 0){ //El cuerpo del robot según la tecla que presione el jugador
      rect(10, 10, 20, 10);
      rect(30, 10, 20, 10);
      for(int i = 1; i <= 4; i++){
        for(int j = 1; j <= 4; j++){
          rect(10*i, 30+10*j, 10, 10);
        }
      }
    }else if(input[2] == 'a' && cubo.salt == 0){
      //En este else if y en el siguiente se alteran los botones que posee tetra en su torso para dar la ilusión de movimiento
      rect(0,10, 20, 10);
      for(int i = 1; i <= 2; i++){
        for(int j = 1; j <= 4; j++){
          rect(10*i-10, 30+10*j, 10, 10);
        }
      }
    }else if(input[1] == 'd' && cubo.salt == 0){
      rect(40,10, 20, 10);
      for(int i = 1; i <= 2; i++){
        for(int j = 1; j <= 4; j++){
          rect(50-10*i+10, 30+10*j, 10, 10);
        }
      }
    }
    popMatrix();
    //Brazo Adelante
    fill(20, 155, 20);
    pushMatrix();
    translate(100-pow(lon,2), 140+5*sin(tim/15+1.5));
    rotate(-ang);
    rect(-10, 0, 15, 60);
    fill(0 , 255, 0);
    rect(-10, 50, 15, 10);
    popMatrix();
    popMatrix();
    //Dinámica de los brazos
    if(input[1] == 'd' && cubo.salt == 0){ 
      ang = PI/3*sin(tim/10);
       //Ángulo aumenta y "lon" es fijado como raiz de 45
      lon = sqrt(45);
    }if(input[2] == 'a' && cubo.salt == 0){
      ang = PI/3*sin(tim/10);
      
      lon = -sqrt(45); //Lo mismo que antes solo que "lon" tiene signo contrario, esto para que el ojo mire hacia el otro lado
    }if(vehit(jpos.x, jpos.y+l, a, 0, 1, grilla) || input[1] == 0 && input[2] == 0){
      ang = 0;
      lon = 0;
    }
    tim++;
  }  
  
  /*_________________________________________________________________________________________________________________________________________*/
  
  void sprite() {
    fill(255, 0, 0);
    tetra(jpos.x, jpos.y, 0.2); //El tercer parámetro es 0.2 para que el tamaño sea el indicado para jugar
    fill(-1);
    genhitbox(jpos.x, jpos.y, a, l, 2, grilla);
  }
}
