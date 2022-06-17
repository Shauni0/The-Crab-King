class Enemy {

  public int x;
  public int y;
  public int speedX;
  public int maxSpeedX;
  public int speedY;
  public int maxSpeedY;

  Enemy(int x, int y) {
    this.x=x;
    this.y=y;
  }
  //moving enemies
  void crabMovement()
  {
    //X cord
    if (this.x > player.x)
    {
      this.speedX--;
      if (speedX < (maxSpeedX*-1)) {
        speedX = maxSpeedX*-1;
      }
    } else if (this.x < player.x) {
      this.speedX++;
      if (speedX > maxSpeedX) {
        speedX = maxSpeedX;
      }
    } else if (this.x == player.x) {
      this.speedX = maxSpeedX;
    }
    //Y cord
    if (this.y > player.y)
    { 
      this.speedY--;
      if (speedY < (maxSpeedY*-1)) {
        speedY = maxSpeedY*-1;
      }
    } else if (this.y < player.y)
    { 
      this.speedY++;
      if (speedY > maxSpeedY) {
        speedY = maxSpeedY;
      }
    } else if (this.y == player.y) {
      this.speedY = maxSpeedY;
    }
    this.y = this.y + this.speedY;
    this.x = this.x + this.speedX;

    if (speedX == player.x && speedY == player.y) {
      this.speedX = player.x;
      this.speedY = player.y;
    }
  }
}
