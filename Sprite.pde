class Sprite {
  private float x, y;
  private PImage image;
  private float velocity;
  private float angle;

  private float rotX_offset  = 0;
  private float rotY_offset  = 0;


  public Sprite(PImage img, float x, float y, float v, float a) {
    this.image = img;
    setPosition(x, y);
    this.velocity = v;
    setAngle(a);
  }

  public void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void setAngle(float a) {
    this.angle = a;
  }

  public void setRotOffset(float rxo, float ryo) {
    this. rotX_offset = rxo;
    this.rotY_offset = ryo;
  }


  public void draw() {

    pushMatrix();
    translate(x, y);
    pushMatrix();
    rotate(angle);
    translate (-image.width/2, -image.height/2);
    image(image, rotX_offset, rotY_offset);
    popMatrix();
    popMatrix();
  }
}
