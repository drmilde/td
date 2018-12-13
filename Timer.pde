class Timer {
  private long startTime;
  private boolean cyclic = false;
  private float from;
  private float to;
  private long duration;

  // callback
  ITimerCallback tc = null;

  public Timer(long duration, float from, float to, boolean cyclic, ITimerCallback tc) {
    this.duration = duration;
    this.from = from;
    this.to = to;
    this.cyclic = cyclic;
    this.tc = tc;
  }

  public Timer(long duration, float from, float to, boolean cyclic) {
    this(duration, from, to, cyclic, null);
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
      // wenn registriert, ruft den alarm auf
      if (tc != null) {
        tc.alarm();
      }
    }

    return constrain(map(diff, 0, duration, from, to), from, to);
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


class DistanceTimer {
  private long startTime;
  private long duration;
  private float distanceTravelled;
  private float targetDistance;

  public DistanceTimer(long duration, float to) {
    this.duration = duration;
    this.targetDistance = to;
    startTimer();
  }

  public void startTimer() {
    startTime = millis();
    distanceTravelled = 0;
  }

  public float getForward() {
    long diff = millis() - startTime;
    float newPos = map(diff, 0, duration, 0, targetDistance);
    newPos = constrain(newPos, 0, targetDistance);
    float step = newPos - distanceTravelled;
    distanceTravelled = newPos;
    return step;
  }
  
  public boolean isFinished() {
    return ((millis() - startTime) > duration);
  }
}
