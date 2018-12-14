class Path {
  private PathElement[] nodes;
  private int current = 0;

  public Path(int size) {
    nodes = new PathElement[size];
    clearPath();
  }


  public void clearPath() {
    for (int i = 0; i < nodes.length; i++) {
      nodes[i] = null;
    }
    current = 0;
  }


  public void add(PathElement element) {
    if (current < nodes.length) {
      nodes[current] = element;
    }
    current++;
  }
  
  
  
}
