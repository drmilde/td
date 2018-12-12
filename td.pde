float x;
Timer tm;
//SimpleParticle pt;
ParticleSystem ps;

void setup() {
  size(1280, 720);
  tm = new Timer(1000, 0, width, false);
  //pt = new SimpleParticle(width/2, height/2, 3.5, null);
  ps = new ParticleSystem(20);
}

void draw() {
  background(127);

  /*
  x = tm.update();
   ellipse(x, 360, 20,20);
   
   pt.pointTo(mouseX, mouseY);
   pt.update();
   pt.draw();
   */

  ps.pointTo(mouseX, mouseY);
  ps.update();
  ps.draw();


  //println(frameRate);
}


void mouseReleased() {
  tm.startTimer();  
  //ps.scramble();
  ps.add(new SimpleParticle(mouseX, mouseY, random(2,4), ps));
}
