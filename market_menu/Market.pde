class Market {
  PImage market;
  float s;
  Market() {
    market = loadImage("Shop.png");
  }  
  void display() {
    rect(249, 49, 701, 601);
    image(market, 250, 50, 700, 600);
  }
  void shop() {
    s = 43;
    if (mouseX>=337 && mouseX<=380 && mouseY>=114 && mouseY<=157) {
      fill(0, 160);
      rect(337, 114, s, s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=337 && mouseX<=380 && mouseY>=114+s && mouseY<=157+s) {
      fill(0, 160);
      rect(337, 114+s, s, s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=337 && mouseX<=380 && mouseY>=114+2*s && mouseY<=157+2*s) {
    fill(0,160);
        rect(337,114+2*s,s,s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=337 && mouseX<=380 && mouseY>=114+3*s && mouseY<=157+3*s) {
    fill(0,160);
        rect(337,114+3*s,s,s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=337 && mouseX<=380 && mouseY>=114+4*s && mouseY<=157+4*s) {
    fill(0,160);
        rect(337,114+4*s,s,s);
     if(mousePressed == true){
      }
    }
    
    if (mouseX>=337 && mouseX<=380 && mouseY>=114+5*s && mouseY<=157+5*s) {
    fill(0,160);
        rect(337,114+5*s,s,s);
      if(mousePressed == true){
      }
    }
    
        if (mouseX>=645 && mouseX<=688 && mouseY>=114 && mouseY<=157) {
      fill(0, 160);
      rect(645, 114, s, s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=645 && mouseX<=688 && mouseY>=114+s && mouseY<=157+s) {
      fill(0, 160);
      rect(645, 114+s, s, s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=645 && mouseX<=688 && mouseY>=114+2*s && mouseY<=157+2*s) {
    fill(0,160);
        rect(645,114+2*s,s,s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=645 && mouseX<=688 && mouseY>=114+3*s && mouseY<=157+3*s) {
    fill(0,160);
        rect(645,114+3*s,s,s);
      if(mousePressed == true){
      }
    }
    
    if (mouseX>=645 && mouseX<=688 && mouseY>=114+4*s && mouseY<=157+4*s) {
    fill(0,160);
        rect(645,114+4*s,s,s);
     if(mousePressed == true){
      }
    }
    
    if (mouseX>=645 && mouseX<=688 && mouseY>=114+5*s && mouseY<=157+5*s) {
    fill(0,160);
        rect(645,114+5*s,s,s);
      if(mousePressed == true){
      }
    }
  }
}

