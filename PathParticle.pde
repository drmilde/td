// Pfad folgendes Objekt
// wird im Partikelsystem verwaltet
// JTM 12/2018

class PathParticle extends Particle {
  private Path path;
  private Timer timer;

  public PathParticle(float x, float y, Path path, ParticleSystem parent) {
    super(x, y, 0, parent);
    this.path = path;
    dead = false;

    sprite = new Sprite(loadImage("rocket_00.png"), 0, 0, true);

    timer = new Timer(20000);
    timer.startTimer();
  }

  void draw() {
    // do something useful here
    pushMatrix();
    pushStyle();
    translate(locRot.getXPos(), locRot.getYPos());
    rotate(locRot.getOrientation());
    sprite.draw();
    popStyle();
    popMatrix();
  }

  void update() {
    float val = timer.update();
    float ival = map(val, 0, 1, 0, path.getNumberOfPathElements()-1);
    int idx = int(ival);
    this.jumpTo(path.get(idx).getXPos(), path.get(idx).getYPos());
    
    dead = timer.isReady();
  }
}
