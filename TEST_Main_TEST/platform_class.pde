class platform {
  PVector loc;
  float sz;


  platform() {
    loc=new PVector (width/2, height-20);
    sz=50;
  }

  void display() {
    rect(loc.x, loc.y, sz, sz);
  }

  void bounce() {
    
  }
}

