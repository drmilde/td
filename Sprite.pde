class Sprite {
  private PImage image;
  private float rotX_offset  = 0;
  private float rotY_offset  = 0;

  public Sprite(PImage img, float xo, float yo, boolean center) {
    this.image = img;
    if (center) {
      setRotOffset(-img.width/2 + xo, -img.height/2 + yo);
    } else {
      setRotOffset(xo, yo);
    }
  }


  public void setRotOffset(float rxo, float ryo) {
    this.rotX_offset = rxo;
    this.rotY_offset = ryo;
  }


  public void draw() {
    pushMatrix();
    image(image, rotX_offset, rotY_offset);
    popMatrix();
  }
}
