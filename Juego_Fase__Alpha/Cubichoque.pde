class Cubichoque{
  float rot,t = 0;
  PVector cpos;
  boolean salt,psalt;
  Cubichoque(){
    cpos = new PVector(width/2,height/2);
  }
  
  void dibujar(){
    if(salt){
      t += 0.1;
      pushMatrix();
      translate(tetra.jpos.x+tetra.a/2,tetra.jpos.y+tetra.l/2);
      rotate(t);
      noStroke();
      fill(25, 25 ,200);
      rect(20, 20, 2*a, 2*l);
      fill(250, 250, 0);
      rect(25+a/2, 25+l/2, a/2, l/2);
      popMatrix();
    }
    else{
      t += 0.2;
      cpos.x += (tetra.jpos.x-a-cpos.x)/10;
      cpos.y += (tetra.jpos.y-a-cpos.y)/10+sin(t/6);
      pushMatrix();
      translate(cpos.x, cpos.y);
      rotate(t);
      noStroke();
      fill(25, 25 ,200);
      rect(-a, -l, 2*a, 2*l);
      fill(250, 250, 0);
      rect(-a/4, -l/4, a/2, l/2);
      popMatrix();
    }
    
  }
  void disp(){
    
  }
}
