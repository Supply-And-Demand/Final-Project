class boss {
  PImage boss, bullet;
  PVector loc, vel, locBullet, velBullet;
  int d;

  boss(float x, float y) {
    boss=loadImage("Boss.png");
    bullet= loadImage("bullet.png");
    loc= new PVector(x, y);
    locBullet= new PVector (x, y);
    velBullet= new PVector(random(-4, -3), random(0,4));
    d=50;
  }

  void display() {
    image(boss, 600, 200, 600, 500);
  }

  void BulletMove() {
    locBullet.add(velBullet);
    if (locBullet.x<0||locBullet.x>width||locBullet.y+35/2>height|| locBullet.y<0) {
      println("yes");
      locBullet.x=random(600,800);
      locBullet.y= random(400,600);
    }
  }
  void BulletDisplay() {
    image(bullet, locBullet.x, locBullet.y, d-15, d-15); 
    locBullet.add(velBullet);
  }
  boolean hit() {
    if (locBullet.dist(c.loc)<d/2){
      println("no");
      locBullet.x=700;
      locBullet.y= 400;
      return true;
    } else {
      return false;
    }
  }
}

