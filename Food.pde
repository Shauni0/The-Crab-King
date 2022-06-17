class Food //<>// //<>//
{
  public int x;
  public int y;
  private int imageSelector;
  private PImage food1 = loadImage("food1.png");
  private PImage food2 = loadImage("food2.png");
  private PImage food3 = loadImage("food3.png");

  Food(int x, int y)
  {
    this.x = x;
    this.y = y;
    food1.resize(20, 20);
    food2.resize(20, 20);
    food3.resize(20, 20);
  }

  void renderFood()
  {
    image(food1, x, y);
    imageSelector ++;
    if (imageSelector >= 0 && imageSelector < 60)
    {
      image(food1, x, y);
    } else if (imageSelector >= 60 && imageSelector < 120)
    {
      image(food2, x, y);
    } else if (imageSelector >= 120 && imageSelector <180)
    {
      image(food3, x, y);
    } else if (imageSelector == 180)
    {
      image(food1, x, y);
      imageSelector = 0;
      println(imageSelector);
    }
  }
}
