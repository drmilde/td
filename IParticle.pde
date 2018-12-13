interface IUpdateable {
  public void update();
  public void draw();
}

interface IKillable {
  public boolean isDead();
}

interface IParticle extends IUpdateable{
  // bewegungroutinen
  public void pointTo(ITarget target);
  public void jumpTo(float px, float py);
  public void setIDX(int idx);
}
