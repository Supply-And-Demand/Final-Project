class boss {
  PImage boss, bullet;
  PVector loc, vel, locBullet, velBullet;
  int d;

  boss(float x, float y) {
    boss=loadImage("Boss.png");
    bullet= loadImage("bullet.png");
    loc= new PVector(x, y);
    locBullet= new PVector (x, y);
    velBullet= new PVector(random(-3,3), random(-5,5));
//velBullet= new PVector(-3,0);
    d=50;
  }

  void display() {
    image(boss, loc.x, loc.y);
  }

  void BulletMove() {
    locBullet.add(velBullet);
    //    if (locBullet.x<0) {
    //      locBullet.x=loc.x;
    //    }
  }
    void BulletDisplay() {//displays particles as ellipses
//    fill(pcolor, psaturation, 100, ptransparency); 
//    ptransparency-=1;//particle becomes less transparent
    image(bullet, locBullet.x, locBullet.y+100, d-15, d-15); 
    locBullet.add(velBullet);
    
  }
    boolean hit() {
    if (locBullet.x-35/2<c.loc.x+30 && locBullet.y+35/2>c.loc.y-30){//if fbomb hits him && 30 bc 60/2
      return true;
    } else {
      return false;
    }
  }
}
  
  

