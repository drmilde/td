interface IUpdateable {
  public void update();
  public void draw();
}


interface IParticle extends IUpdateable{
  // bewegungroutinen
  public void pointTo(ITarget target);
  public void jumpTo(float px, float py);
  public void setIDX(int idx);
  public boolean isDead();
}
