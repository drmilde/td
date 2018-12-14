// Einfaches bewegbares Objekt
// wird im Partikelsystem verwaltet
// JTM 12/2018

class SimpleParticle extends Particle implements ITimerCallback {
  private Timer spawnTimer; 

  public SimpleParticle(float x, float y, float speed, ParticleSystem parent) {
    super(x, y, speed, parent);

    sprite = new Sprite(loadImage("towerDefense_tile250_0_degrees.png"), 10, 0, true);
    sprite = new Sprite(loadImage("geschuetzturm_0_degrees.png"), 10, 0, true);
    spawnTimer = new Timer(500, 0, 1, true, this);
    spawnTimer.startTimer();
    dead = false;
  }

  public SimpleParticle(float x, float y, ParticleSystem parent) {
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
    locRot.forward(speed);
    spawnTimer.update();
  }

  // ITimerCallback

  public void alarm() {
    //println ("boom");
    ps.add(new RocketParticle(getX(), getY(), random(0, 0), parent));
  }
}
