class Market {
  PImage market;
  float s;
  Market() {
    market = loadImage("Shop.png");
  }  
  void display() {
    rect(249, 49, 702, 602);
    image(market, 250, 50, 700, 600);
    noStroke();
  }
  void shop() {
    s = 44;
    if (mouseX>=337 && mouseX<=380 && mouseY>=116 && mouseY<=159) {
      fill(0, 160);
      rect(337, 116, s, s);
      fill(250, 0, 0);
      text("Increases the amount of money you obtain.", 337, 380);
    }

    if (mouseX>=337 && mouseX<=380 && mouseY>=115+s && mouseY<=158+s) {
      fill(0, 160);
      rect(337, 115+s, s, s);
       fill(250, 0, 0);
      text("Increases the amount of ammo you have to 2.", 337, 380);
    }

    if (mouseX>=337 && mouseX<=380 && mouseY>=113+2*s && mouseY<=156+2*s) {
      fill(0, 160);
      rect(337, 113+2*s, s, s);
       fill(250, 0, 0);
      text("Increases your speed when equipped.", 337, 380);
    }

    if (mouseX>=337 && mouseX<=380 && mouseY>=112+3*s && mouseY<=155+3*s) {
      fill(0, 160);
      rect(337, 111+3*s, s, s);
       fill(250, 0, 0);
      text("Increases your pencil's speed.", 337, 380);
    }


    if (mouseX>=645 && mouseX<=688 && mouseY>=114 && mouseY<=157) {
      fill(0, 160);
      rect(645, 114, s, s);
       fill(250, 0, 0);
      text("Increases your health to full.", 337, 380);
    }

    if (mouseX>=645 && mouseX<=688 && mouseY>=113+s && mouseY<=156+s) {
      fill(0, 160);
      rect(645, 113+s, s, s);
       fill(250, 0, 0);
      text("Increases your health by 1.", 337, 380);
    }

    if (mouseX>=645 && mouseX<=688 && mouseY>=114+2*s && mouseY<=157+2*s) {
      fill(0, 160);
      rect(645, 112+2*s, s, s);
       fill(250, 0, 0);
      text("Increases ammo to 4 and doubles length.", 337, 380);
    }
  }
}

