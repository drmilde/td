// Einfaches bewegbares Objekt
// wird im Partikelsystem verwaltet
// JTM 12/2018

class RocketParticle extends Particle {
  private DistanceTimer dt;
  
  public RocketParticle(float x, float y, float speed, ParticleSystem parent) {
    super(x, y, speed, parent);

    sprite = new Sprite(loadImage("rocket_00.png"), 0, 0, true);
    dt = new DistanceTimer(2000, 600);
    dead = false;
  }

  public RocketParticle(float x, float y, ParticleSystem parent) {
    super(x, y, 0, parent);
    dead = false;
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
    if (!dt.isFinished()) {
      locRot.forward(dt.getForward());
    } else {
      dead = true;
    }
  }

  public void pointTo(Target target) {
    locRot.pointTo(target.getX(), target.getY());
  }

  public void jumpTo(float px, float py) {
    locRot.jumpTo(px, py);
  } 
}
