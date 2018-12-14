class CollisionMap {
  private PImage colorMap;
  private float[] trackVals;
  private int[] trackCount;
  private int step = 5;

  public CollisionMap(String fname) {
    colorMap = loadImage(fname);
    createTrackingData();
  }

  public boolean collides(float px, float py, color c) {
    color farbe = colorMap.get(int(px), int(py));
    return(farbe == c);
  }

  private void createTrackingData() {
    trackVals = new float[colorMap.width/step];
    trackCount = new int[colorMap.width/step];
    clearTrackMarker();
    countTrackingMarker();
  }

  private void clearTrackMarker() {
    for (int i = 0; i < trackVals.length; i++) {
      trackVals[i] = 0;
      trackCount[i] = 0;
    }
  }

  public void countTrackingMarker() {
    clearTrackMarker();
    for (int u = 0; u < width; u++) {
      for (int v = 0; v < height; v++) {
        countMarker(u, v);
        countMarker(v, u);
      }
    }
  }

  private void countMarker(int u, int v) {
    if (collides(u, v, #0000ff)) {
      trackVals[u/step] += v;
      trackCount[u/step] += 1;
    }
  }

  private void drawTrackingMarker() {
    for (int i = 0; i < trackVals.length; i++) {
      float u = i*step;
      float v = trackVals[i]/trackCount[i]; 

      pushStyle();
      noStroke();
      ellipse(u, v, 5, 5);
      popStyle();
    }
  }


  public Path createTrackingPath() {
    Path tp = new Path(trackVals.length);
    
    for (int i = 0; i < trackVals.length; i++) {
      float u = i*step;
      float v = trackVals[i]/trackCount[i]; 
      tp.add(new PathElement(u, v, 0));
    }
    
    return tp;
  }


  public void draw() {
    image(colorMap, 0, 0);
    drawTrackingMarker();
  }
}
