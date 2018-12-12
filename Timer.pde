class Timer {
  private long startTime;
  private boolean cyclic = false;
  private float from;
  private float to;
  private long duration;

  public Timer(long duration, float from, float to, boolean cyclic) {
    this.duration = duration;
    this.from = from;
    this.to = to;
    this.cyclic = cyclic;
  }

  public Timer(long duration, boolean cyclic) {
    this(duration, 0, 1, cyclic);
  }

  public Timer(long duration) {
    this(duration, 0, 1, false);
  }

  public void startTimer() {
    startTime = millis();
  }

  public float update() {
    long diff = (millis() - startTime);

    if (diff > duration) {
      if (cyclic) {
        startTimer();
      } 
      return to;
    }

    return map(diff, 0, duration, from, to);
  }
  
  public boolean isReady() {
    return ((millis() - startTime) > duration);
  }

  public long currentValue() {
    return (millis() - startTime);
  }
}

class SystemTimer {
  private long startTime;
  private long lastUpdateTime;

  public SystemTimer() {
    startTimer();
  }

  public void startTimer() {
    startTime = millis();
    lastUpdateTime = startTime;
  }
  
  public long update() {
    long diff = millis() - lastUpdateTime;
    lastUpdateTime = millis();
    return diff;
  }
  
  public long runningFor() {
    return (millis() - startTime);
  }
}
