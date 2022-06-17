class LandCrab extends Enemy //Other Crabs are the KingCrab's enemies because of the fall of the Crown
  //I mean you would think he could just take the crown off but apparently not.
{
  private PImage Crab = loadImage("crab.png");

  LandCrab(int x, int y)
  {
    super(x, y);
    this.Crab.resize(30, 30);
    maxSpeedX = (int)random(1, 3);
    maxSpeedY = (int)random(1, 3);
  }

  void renderLandCrab()
  {
    image(Crab, this.x, this.y);
    renderLife();
  }

  void renderLife()
  {
    rectMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    rect(width/2, 10, 500, 10, 5);
    fill(0, 255, 0);
  }
}
