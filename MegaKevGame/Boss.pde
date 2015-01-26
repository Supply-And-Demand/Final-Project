class boss {
  PImage boss, bullet;
  PVector loc, vel, locBullet, velBullet;
  int d;

  boss(float x, float y) {
    boss=loadImage("Boss.png");
    bullet= loadImage("bullet.png");
    loc= new PVector(x, y);
    locBullet= new PVector (x, y);
    velBullet= new PVector(random(-5, -3), random(-5,5));
//    velBullet= new PVector(random(-5,5),0);
    d=50;
  }

  void display() {
    image(boss, 600, 200, 600, 500);
  }

  void BulletMove() {
    locBullet.add(velBullet);
    if (locBullet.x<0||locBullet.x>width||locBullet.y+35/2>height|| locBullet.y<0) {
      println("yes");
      locBullet.x=700;
      locBullet.y= 400;
      velBullet.x=random(-5,-3);
    }
  }
  void BulletDisplay() {//displays particles as ellipses
    //    fill(pcolor, psaturation, 100, ptransparency); 
    //    ptransparency-=1;//particle becomes less transparent
    image(bullet, locBullet.x, locBullet.y, d-15, d-15); 
    locBullet.add(velBullet);
  }
  boolean hit() {
//    if (locBullet.x-35/2<c.loc.x+30 && locBullet.y+(35/2)>c.loc.y-30) {//if fbomb hits him && 30 bc 60/2
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

//&& locBullet.y+35/2>c.loc.y 
//locBullet.x-35/2<c.loc.x+30  

