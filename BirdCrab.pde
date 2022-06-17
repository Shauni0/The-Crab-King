class BirdCrab extends Enemy {

  private PImage BirdCrab = loadImage("Nightfurry.png");

  BirdCrab(int x, int y)
  {
    super(x, y);
    this.BirdCrab.resize(50, 100);
  }

  void renderBirdCrab()
  {
    image(BirdCrab, this.x, this.y);
    this.x += 8;
  }
}
