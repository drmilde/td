interface IUpdateable {
  public void update();
  public void draw();
}

interface IParticle extends IUpdateable{
  // bewegungroutinen
  public void pointTo(float px, float py);
  public void jumpTo(float px, float py);
}
