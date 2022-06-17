class Health
{
  public int x;
  public int y;
  private int imageSelector;
  private PImage health1 = loadImage("health1.png");
  private PImage health2 = loadImage("health2.png");
  private PImage health3 = loadImage("health3.png");

  Health(int x, int y)
  {
    this.x = x;
    this.y = y;
    health1.resize(20, 20);
    health2.resize(20, 20);
    health3.resize(20, 20);
  }

  void renderHealth()
  {
    image(health1, x, y);
    imageSelector ++;
    if (imageSelector >= 0 && imageSelector < 60)
    {
      image(health1, x, y);
    } else if (imageSelector >= 60 && imageSelector < 120)
    {
      image(health2, x, y);
    } else if (imageSelector >= 120 && imageSelector <180)
    {
      image(health3, x, y);
    } else if (imageSelector == 180)
    {
      image(health1, x, y);
      imageSelector = 0;
      println(imageSelector);
    }
  }
}
