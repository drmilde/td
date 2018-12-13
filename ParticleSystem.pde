class ParticleSystem {
  private IParticle[] teilchen = new IParticle[128];
  private int current = 0;
  private int count = 0;

  public ParticleSystem(int size) {
    if (size > 0) {
      teilchen = new IParticle[size];
    } else {
      teilchen = new IParticle[128];
    }
    initTeilchen();
  }

  private void initTeilchen() {
    clear();
    //createRandomParticles();
  }

  private void createRandomParticles() {
    for (int i = 0; i < teilchen.length; i++) {
      add(new RocketParticle(random (width), random(height), random (2, 4), this));
    }
  }

  public void clear() {
    for (int i = 0; i< teilchen.length; i++) {
      teilchen[i] = null;
    }
    count = 0;
  }

  public void clear(int idx) {
    teilchen[idx] = null;
    count--;
  }

  public boolean isFull() {
    return (count >= teilchen.length);
  }

  // methoden particle system
  public int getCurrent() {
    return current;
  }

  public void add (IParticle pt) {
    if (!isFull()) {
      adjustCurrent();
      if (pt != null) {
        pt.setIDX(current);
      }
      teilchen[current] = pt;

      current++;
      current %= teilchen.length;

      count++;
    } 
  }
  
  private void adjustCurrent() {
    // aktuelles ist leer
    if (teilchen[current] == null) {
      return;
    }
   
    // such dir eins
    for (int i = 0; i < teilchen.length; i++) {
      if (teilchen[i] == null) {
        current = i;
        return;
      }
    }
  }

  // interface methoden IUpdateable
  public void draw() {
    for (int i = 0; i< teilchen.length; i++) {
      if (teilchen[i] != null) {
        teilchen[i].draw();
      }
    }
  }

  public void update() {
    for (int i = 0; i< teilchen.length; i++) {
      if (teilchen[i] != null) {
        teilchen[i].update();
        
        // entferne die leichen
        if (teilchen[i].isDead()) {
          teilchen[i] = null;
          current = i;
          count--;
        }
        
      }
    }
  }

  // test methode: interface methoden IParticle
  // alle patrikel des Partikelsystem richten sich auf den 
  // punkt px, py hin aus
  public void pointTo(float px, float py) {
    for (int i = 0; i< teilchen.length; i++) {
      if (teilchen[i] != null) {
        teilchen[i].pointTo(new Target(px, py));
      }
    }
  }

  // test methode: ruft jumpTo(x,y) auf
  public void scramble() {
    for (int i = 0; i< teilchen.length; i++) {
      if (teilchen[i] != null) {
        teilchen[i].jumpTo(random(width), random(height));
      }
    }
  }
}
