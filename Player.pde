class Player
{

  private int x;
  private int y;
  private int activeImage = 1;
  private int health = 10;
  private int RecoverHealth;
  
  //images for player
  private PImage crabKing1 = loadImage("crabKing1.png");
  private PImage crabKing2 = loadImage("crabKing2.png");
  private PImage crabKing3 = loadImage("crabKing3.png");
  private PImage crabKing4 = loadImage("crabKing4.png");

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    crabKing1.resize(50, 50);
    crabKing2.resize(50, 50);
    crabKing3.resize(50, 50);
    crabKing4.resize(50, 50);

    if (activeImage == 1)
    {
      image(this.crabKing1, this.x, this.y);
    }
    if (activeImage == 2)
    {
      image(this.crabKing3, this.x, this.y);
    }
    if (activeImage == 3)
    {
      image(this.crabKing4, this.x, this.y);
    }
    if (activeImage == 4)
    {
      image(this.crabKing2, this.x, this.y);
    }
    keyPressed();
    RecoverHealth();
  }

  void keyPressed() //player movesment
  {
    if (key == CODED) 
    {
      if (keyCode == UP && player.y > 50) //move player up
      {
        player.y -= 4;
        activeImage = 1;
      } else if (keyCode == DOWN && player.y < height - 60) //move player down
      {
        player.y += 4;
        activeImage = 2;
      } else if (keyCode == LEFT && player.x >= 10) //move player left
      {
        player.x -= 4;
        activeImage = 3;
      } else if (keyCode == RIGHT && player.x < width - 60)
      {
        player.x += 4;
        activeImage = 4;
      }
    }
  }
  
  void RecoverHealth()
  {
    if (RecoverHealth == 4)
    {
      RecoverHealth = 0;
      health ++;
    } else if (RecoverHealth >= 8)
    {
      RecoverHealth = 0;
      health += 2;
    }
  }
}
