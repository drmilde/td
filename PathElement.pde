class PathElement {
  private PolarPosition locRot;
  private long moveTime = 1000;
  private long rotTime = 1000;
  
  public PathElement(float x, float y, float orientation) {
    locRot = new PolarPosition(x,y);
    locRot.setOrientation(orientation);
    moveTime = 1000;
    rotTime = 1000;
  }
  
  
  // getter
  
  public float getXPos() {
    return locRot.getXPos();
  }

  public float getYPos() {
    return locRot.getYPos();
  }

  public float getOrientation() {
    return locRot.getOrientation();
  }
  
  public long getMoveTime() {
    return moveTime;
  }

  public long getRotTime() {
    return rotTime;
  }
   
  // setter
  
  public void setOrientation(float orientation) {
    locRot.setOrientation(orientation);
  }

  public void setMoveTime(long moveTime) {
    this.moveTime = moveTime;
  }

  public void setRotTime(long rotTime) {
    this.rotTime = rotTime;
  }

}
