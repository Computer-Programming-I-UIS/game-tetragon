float x = 0,y, a = 5, l = 5, t = 0, d = 0;
float[] u = new float[3];
PFont mono;

void setup(){
  size(800, 600);
  mono = createFont("Impact", 32);
}

void draw(){
  background(0);
  t = menu(t);
  t++;
  println( " X: " + mouseX + " Y: "+ mouseY);
}
