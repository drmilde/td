class ParticleSystem {
  private int MAX_NUMBER = 128;
  private IParticle[] teilchen = new IParticle[MAX_NUMBER];
  private int current = 0;

  public ParticleSystem(int size) {
    if (size > 0) {
      this.MAX_NUMBER = size;
    } else {
      this.MAX_NUMBER = 128;
    }
    teilchen = new IParticle[MAX_NUMBER];
    initTeilchen();
  }

  private void initTeilchen() {
    clear();
    //createRandomParticles();
  }

  private void createRandomParticles() {
    for (int i = 0; i< MAX_NUMBER; i++) {
      add(new SimpleParticle(random (width), random(height), random (2, 4), this));
    }
  }

  public void clear() {
    for (int i = 0; i< MAX_NUMBER; i++) {
      add(null);
    }
  }

  // methoden particle system
  public int getCurrent() {
    return current;
  }

  public void add (IParticle pt) {
    teilchen[current] = pt;
    current++;
    current %= MAX_NUMBER;
  }


  // interface methoden IUpdateable
  public void draw() {
    for (int i = 0; i< MAX_NUMBER; i++) {
      if (teilchen[i] != null) {
        teilchen[i].draw();
      }
    }
  }

  public void update() {
    for (int i = 0; i< MAX_NUMBER; i++) {
      if (teilchen[i] != null) {
        teilchen[i].update();
      }
    }
  }

  // test methode: interface methoden IParticle
  // alle patrikel des Partikelsystem richten sich auf den 
  // punkt px, py hin aus
  public void pointTo(float px, float py) {
    for (int i = 0; i< MAX_NUMBER; i++) {
      if (teilchen[i] != null) {
        teilchen[i].pointTo(px, py);
      }
    }
  }

  // test methode: ruft jumpTo(x,y) auf
  public void scramble() {
    for (int i = 0; i< MAX_NUMBER; i++) {
      if (teilchen[i] != null) {
        teilchen[i].jumpTo(random(width), random(height));
      }
    }
  }
}
