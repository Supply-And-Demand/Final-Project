Enemy e= new Enemy(750,550);
void setup(){
  size(800,600);

}

void draw(){
background(0);
  
  e.display();
  e.move();
  
}







///////////////////
class Enemy {
  PVector loc, vel;
  float d;
  
  Enemy(float x, float y){
   loc= new PVector (x,y);
  vel= new PVector(-1,0);

  d=50;
  }
  
  void display(){
    ellipse(loc.x,loc.y,d,d);
  }
  void move(){
  loc.add(vel); 
  }
}
