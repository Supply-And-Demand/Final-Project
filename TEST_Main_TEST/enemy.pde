class Enemy {
  PVector locEnemy, locBullet, velEnemy, velBullet;
  float d;
  PImage bullet, Enemy1, Enemy2, Enemy3, Enemy4;
  float imagerunning;



  Enemy(float x, float y) {
    locEnemy= new PVector (x, y);
    velEnemy= new PVector(-1, 0);
    locBullet= new PVector (locEnemy.x-20, y);
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

    if (imagerunning==1) {
      image(Enemy1, locEnemy.x, locEnemy.y);
    }
    if (imagerunning==2) {
      image(Enemy2, locEnemy.x, locEnemy.y);
    }
    if (imagerunning==3) {
      image(Enemy3, locEnemy.x, locEnemy.y);
    }
    if (imagerunning==4) {
      image(Enemy4, locEnemy.x, locEnemy.y);
    }

    imagerunning=imagerunning+.25;
    if (imagerunning>4) {
      imagerunning=1;
    }
  }
  void move() {
    locEnemy.add(velEnemy);
  }
  void attack() {
    image(bullet, locBullet.x, locBullet.y, d-15, d-15); 
    locBullet.add(velBullet);
    if (locBullet.dist(c.loc)<40/2|| locBullet.x<0) {//100 because that's the size of the enemy
      locBullet.x=locEnemy.x;
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


