interface ITarget {
  public float getX();
  public float getY();
}

public class Target implements ITarget {
  private float x;
  private float y;
  
  public Target(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // interface ITarget
  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

}
