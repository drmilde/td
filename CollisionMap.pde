class CollisionMap {
  private PImage colorMap;
  
  public CollisionMap(String fname) {
    colorMap = loadImage(fname);
  }
  
  public boolean collides(float px, float py, color c) {
    color farbe = colorMap.get(int(px),int(py));
    return(farbe == c);
  }
}
