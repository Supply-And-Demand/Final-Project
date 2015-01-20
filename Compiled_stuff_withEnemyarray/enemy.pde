class Enemy {
  PVector loc, locBullet, vel, velBullet;
  float d, t;
  PImage bullet, Enemy1, Enemy2, Enemy3, Enemy4, EnemyDead;
  float imagerunning;



  Enemy(float x, float y) {
    loc= new PVector (x, y);
    vel= new PVector(-1, 0);
    locBullet= new PVector (loc.x-10, y);
    velBullet= new PVector(-3, 0);
    bullet= loadImage("bullet.png");

    Enemy1= loadImage("Enemy1.png");
    Enemy2= loadImage("Enemy2.png"); 
    Enemy3= loadImage("Enemy3.png");
    Enemy4= loadImage("Enemy4.png");
    EnemyDead= loadImage("deadrobot.png");
    imagerunning=1;
    d=50;
    t=1;
  }

  void display() {

    t +=1;
    if (t>0 && t<11) {
      image(Enemy1, loc.x, loc.y);
    }
    if (t>10 && t<21) {
      image(Enemy2, loc.x, loc.y);
    }
    if (t>20 && t<31) {
      image(Enemy3, loc.x, loc.y);
    }
    if (t>30 && t<41) {
      image(Enemy4, loc.x, loc.y);
    }
    if (t>40) {
      t = 1;
    }
  }
  void move() {
    loc.add(vel);
  }
  void attack() {
    image(bullet, locBullet.x, locBullet.y, d-15, d-15); 
    locBullet.add(velBullet);
    if (locBullet.x<0) {
      locBullet.x=e[0].loc.x;
    }
  }

  boolean hit() {
    if (locBullet.dist(c.loc)<d/2) {//if fbomb hits him
      locBullet.x=loc.x;
      return true;
    } else {
      return false;
    }
  }
  void dead() {
    image(EnemyDead, loc.x, loc.y+20);
  }

  void checkForCharacter(character c) {
    if (loc.dist(c.loc)<500) {
      e[0].attack();
    }
  }

  //    void death{
  //     //.remove 
  //    }
}

