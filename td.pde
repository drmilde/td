float x;
ParticleSystem ps;

PImage level;
CollisionMap cm;

void setup() {
  size(1280, 720);
  ps = new ParticleSystem(300);

  level = loadImage("level_00.png");
  cm = new CollisionMap ("level_00.png");
}

void draw() {
  background(127);
  image(level, 0, 0);


  ps.pointTo(mouseX, mouseY);
  ps.pointTo(width/2, height/2);
  ps.update();
  ps.draw();

  // overlay circle
  if (cm.collides(mouseX, mouseY, #ff0000)) {
    pushStyle();
    noFill();
    strokeWeight(3);
    stroke(#8CF0A2);
    ellipse(mouseX, mouseY, 100, 100);
    popStyle();
  }
  if (cm.collides(mouseX, mouseY, #0000ff)) {
    pushStyle();
    noFill();
    strokeWeight(3);
    stroke(#8CF0A2);
    ellipse(mouseX, mouseY, 100, 100);
    popStyle();
  }
}

void mouseReleased() {
  // check, if placeable
  if (cm.collides(mouseX, mouseY, #ff0000)) {
    ps.add(new SimpleParticle(mouseX, mouseY, random(0, 0), ps));
    println(frameRate);
    // println("placed a tower");
    //ps.add(new RocketParticle(mouseX, mouseY, random(0, 0), ps));
  }
  if (cm.collides(mouseX, mouseY, #0000ff)) {
    ps.add(new PathParticle(mouseX, mouseY, random(0, 0), ps));
  }
}
