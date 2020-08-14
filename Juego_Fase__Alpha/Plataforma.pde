class Plataforma{ 
  float x;
  float y;
  float a;
  float l;
  float t;
  float grilla[][];
  
  Plataforma(float posX, float posY, float ancho, float largo, float tipo, float tempgrilla[][]){
    x = posX;
    y = posY;
    a = ancho;
    l = largo;
    t = tipo;
    grilla = tempgrilla;
  }
  
  void sprite() {
    fill(0, 10, 0);
    rect(x, y, a, l);
    fill(0);
    genhitbox(x, y, a, l, t, grilla);
  }
}
