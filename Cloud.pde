class cloud //<>// //<>//
{
  private int cloudx;
  private float cloudy = random(0, 200);
  private PImage cloud = loadImage("cloud.png");

  void drawCloud()
  {
    cloud.resize(200, 100);
    image(cloud, cloudx, cloudy);
    cloudx += 2;
    if (cloudx == width)
    {
      cloudx = -250;
      cloudy = random(0, 200);
    }
  }
}
