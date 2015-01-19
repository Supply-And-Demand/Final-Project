class Enemy {
  PVector locEnemy, locBullet, velEnemy, velBullet;
  float d,t;
  PImage bullet, Enemy1, Enemy2, Enemy3, Enemy4;
  float imagerunning;



  Enemy(float x, float y) {
    locEnemy= new PVector (x, y);
    velEnemy= new PVector(-1, 0);
    locBullet= new PVector (locEnemy.x-100, y);
    velBullet= new PVector(-3, 0);
    bullet= loadImage("bullet.png");

    Enemy1= loadImage("Enemy1.png");
    Enemy2= loadImage("Enemy2.png"); 
    Enemy3= loadImage("Enemy3.png");
    Enemy4= loadImage("Enemy4.png");
    imagerunning=1;
    d=50;
    t=1;
  }

  void display() {

  t +=1;
   if (t>0 && t<11) {
     image(Enemy1, locEnemy.x, locEnemy.y);
   }
    if (t>10 && t<21) {
     image(Enemy2, locEnemy.x, locEnemy.y);
   }
   if (t>20 && t<31) {
     image(Enemy3, locEnemy.x, locEnemy.y);
   }
   if (t>30 && t<41) {
     image(Enemy4, locEnemy.x, locEnemy.y);
   }
   if(t>40){
   t = 1;
 }
  }
  void move() {
    locEnemy.add(velEnemy);
  }
  void attack() {
    image(bullet, locBullet.x, locBullet.y, d-15, d-15); 
    locBullet.add(velBullet);
    if (locBullet.x<0) {
      locBullet.x=locEnemy.x;
    }
  }

  boolean hit() {
    if (locBullet.dist(c.loc)<d/2) {//if fbomb hits him
      locBullet.x=locEnemy.x;
      return true;
    } else {
      return false;
    }
  }

  void checkForCharacter(character c) {
    if (locEnemy.dist(c.loc)<500) {
      e.attack();
    }
  }

  //    void death{
  //     //.remove 
  //    }
}

