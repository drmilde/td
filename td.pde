float x;
Timer tm;
//SimpleParticle pt;
ParticleSystem ps;

PImage level;
CollisionMap cm;

void setup() {
  size(1280, 720);
  tm = new Timer(1000, 0, width, false);
  //pt = new SimpleParticle(width/2, height/2, 3.5, null);
  ps = new ParticleSystem(200);

  level = loadImage("level_00.png");
  cm = new CollisionMap ("level_00.png");
}

void draw() {
  background(127);
  image(level, 0, 0);

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

  // overlay circle
  if (cm.collides(mouseX, mouseY, #ff0000)) {
    pushStyle();
      noFill();
      strokeWeight(3);
      stroke(#8CF0A2);
      ellipse(mouseX, mouseY, 100,100);
    popStyle();
  }


  //println(frameRate);
}

void mouseReleased() {
  tm.startTimer();  
  //ps.scramble();
  // check, if placeable
  if (cm.collides(mouseX, mouseY, #ff0000)) {
    ps.add(new SimpleParticle(mouseX, mouseY, random(0, 0), ps));
    ps.add(new RocketParticle(mouseX, mouseY, random(0, 0), ps));
  }
}
