class PolarPosition {
  private PVector loc; //current location
  private float orientation; //current orientation

  public PolarPosition(float x, float y) {
    loc = new PVector(x,y); //starting position is at center
    orientation = radians(0); //starting orientation is at 90 degrees
  }

  
  // Berechnungen der Polarkoordinaten
  public void forward(float pixels) {
    loc = PVector.add(loc, polar(pixels, orientation));
  }

  public void left(float theta) {
    orientation += theta;
  }

  public void right(float theta) {
    orientation -= theta;
  }

  public void jumpTo(float x, float y) {
    loc.x = x;
    loc.y = y;
  }

  public void pointTo(float px, float py) {
    orientation = radians(degrees(atan2(py-loc.y, px-loc.x)));
  }
  
  public float distance(PolarPosition other) {
    float a = this.getXPos() - other.getXPos();
    float b = this.getYPos() - other.getYPos();
    
    return (sqrt ((a*a) + (b*b)));
  }

  public float distance(float x, float y) {
    float a = this.getXPos() - x;
    float b = this.getYPos() - y;
    
    return (sqrt ((a*a) + (b*b)));
  }

  // getter
  public float getXPos() {
    return loc.x;
  }

  public float getYPos() {
    return loc.y;
  }

  public float getOrientation() {
    return orientation;
  }

  // setter
  public void setOrientation(float orientation) {
    this.orientation = orientation;
  }

  // helper polar
  private PVector polar(float r, float theta) {
    return new PVector(r*cos(theta), r*sin(theta)); // negate y for left handed coordinate system
  }
}
