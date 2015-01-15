Enemy e;
void setup() {
  size(800, 600);
  e= new Enemy(random(350, 750), 550);
}

void draw() {
  background(250);

  e.display();
  e.move();
  e.attack();
}


///////////////////
class Enemy {
  PVector locEnemy, locBullet, velEnemy, velBullet;
  float d;
  PImage bullet, Enemy1, Enemy2, Enemy3,Enemy4;
  int imagerunning;



  Enemy(float x, float y) {
    locEnemy= new PVector (x, y);
    velEnemy= new PVector(-1, 0);
    locBullet= new PVector (x-20, y);
    velBullet= new PVector(-3, 0);
    bullet= loadImage("bullet.png");
 
     Enemy1= loadImage("Enemy1.png");
     Enemy2= loadImage("Enemy2.png"); 
     Enemy3= loadImage("Enemy3.png");
      Enemy4= loadImage("Enemy4.png");
      imagerunning=1;
    d=50;
  }

  void display() {
//   image('enemy1',locEnemy.x,locEnemy.y,d,d);

   if(imagerunning==1){
     image(Enemy1,locEnemy.x,locEnemy.y);
   }
   if(imagerunning==2){
     image(Enemy2,locEnemy.x, locEnemy.y);
   }
   if(imagerunning==3){
     image(Enemy3,locEnemy.x, locEnemy.y);
   }
   if(imagerunning==4){
     image(Enemy4,locEnemy.x, locEnemy.y);
   }
   
   imagerunning++;
   if(imagerunning>4){
    imagerunning=1; 
   }
   
    
  }
  void move() {
    locEnemy.add(velEnemy);
  }
  void attack() {
    image(bullet, locBullet.x, locBullet.y, d-30, d-30); 
    locBullet.add(velBullet);
  }
 
  void checkForCharacter(character c) {
   if (loc.dist(c.loc)<d/2+c.d/2) {
     e.attack();
   }
    }
    
//    void death{
//     //.remove 
//    }
}

