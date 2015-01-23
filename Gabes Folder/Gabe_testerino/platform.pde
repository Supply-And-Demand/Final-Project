class platform {
  //int [] locx={100,150,350,550};
  //int [] y={height-30,height-150,150,350};
  int [] sz= {
    300, 100, 200, 240
  };
  PImage platform;
  //PVector loc;
  //int sz;
  PVector[] loc = new PVector[3];

  platform(float x, float y) {
    platform= loadImage ("platform.png");
    loc[0] = new PVector(x, y);
  }
  void display() {
    for (int i=0; i<loc.length; i++) {
      //  rect(x[i],y[i],sz[i],sz[i]/2);
      //  image(platform,x[i],y[i],sz[i],sz[i]/2);

      //}
      image(platform, loc[0].x, loc[0].y, 200, 50);
    }
  }

  // void check
  //
}

