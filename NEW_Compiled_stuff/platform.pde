class platform {
  //int [] locx={100,150,350,550};
  //int [] y={height-30,height-150,150,350};
  int [] sz= {
    300, 50
  };
  PImage platform;
  //PVector loc;
  //int sz;
PVector loc;

  platform(float x, float y) {
    platform= loadImage ("platform.png");
    loc = new PVector(x, y);
  }
  void display() {
//    for (int i=0; i<loc.length; i++) {
      //  rect(x[i],y[i],sz[i],sz[i]/2);
      //  image(platform,x[i],y[i],sz[i],sz[i]/2);

      //}
      image(platform, loc.x, loc.y, 200, 50);
    }
  }

  // void check
  //
//}

