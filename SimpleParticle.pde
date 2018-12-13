// Einfaches bewegbares Objekt
// wird im Partikelsystem verwaltet
// JTM 12/2018

class SimpleParticle extends Particle {   
  public SimpleParticle(float x, float y, float speed, ParticleSystem parent) {
    super(x, y, speed, parent);

    sprite = new Sprite(loadImage("towerDefense_tile250_0_degrees.png"), 
    10, 0 , true);
  }

  public SimpleParticle(float x, float y, ParticleSystem parent) {
    super(x, y, 0, parent);
  }

  void draw() {
    // do something useful here
    pushMatrix();
    pushStyle();
    translate(locRot.getXPos(), locRot.getYPos());
    rotate(locRot.getOrientation());
    sprite.draw();
    //rect(0 - 35, 0 - 5, 70, 10);
    //fill(0);
    //textSize(22);
    //text(""+IDX, 0, 0);
    popStyle();
    popMatrix();
  }

  void update() {
    locRot.forward(speed);
  }

  public void pointTo(float px, float py) {
    locRot.pointTo(px, py);
  }

  public void jumpTo(float px, float py) {
    locRot.jumpTo(px, py);
  }
}
