// Bewegbares Objekt
// wird im Partikelsystem verwaltet
// JTM 12/2018

abstract class Particle implements IParticle {

  // physikalische parameter
  protected PolarPosition locRot;  
  protected float speed = 0; // 
  protected float size = 30;

  // umschließendes Partikelsystem
  protected ParticleSystem parent;
  protected int IDX = 0; // index wird duch das Partikelsystem bestimmt

  private Particle(int idx, float x, float y, float speed, ParticleSystem parent) {
    this.locRot = new PolarPosition(x, y); 
    this.speed = speed;
    this.parent = parent;
    this.IDX = idx;
  }

  public Particle(float x, float y, float speed, ParticleSystem parent) {
    this(parent.getCurrent(), x, y, speed, parent);
  }

  public Particle(float x, float y, ParticleSystem parent) {
    this(parent.getCurrent(), x, y, 0, parent);
  }

  abstract void draw(); // muss durch Subklasse implementiert werden
  abstract void update(); // muss durch Subklasse implementiert werden

  public void pointTo(float px, float py) {
    locRot.pointTo(px, py);
  }

  public void jumpTo(float px, float py) {
    locRot.jumpTo(px, py);
  }
}
