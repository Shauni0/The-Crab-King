class score //this is where the score and other UI code stuff goes
{
  public int score = 5000;
  public int level = 1;

  void ScoreTimeDisplay()
  {
    if (score > 4999)
    {
      score = 5000;
    }

    score -= 2;

    rectMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    rect(width/2, 10, 500, 10, 10);
    fill(0, 255, 0);
    rect(width/2, 10, score/10, 10);

    rectMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    rect(width/2+5, 25, 10, 10, 10);   //1
    rect(width/2+15, 25, 10, 10, 10);  //2
    rect(width/2+25, 25, 10, 10, 10);  //3
    rect(width/2+35, 25, 10, 10, 10);  //4
    rect(width/2+45, 25, 10, 10, 10);  //5
    //
    rect(width/2-5, 25, 10, 10, 10);   //6
    rect(width/2-15, 25, 10, 10, 10);  //7
    rect(width/2-25, 25, 10, 10, 10);  //8
    rect(width/2-35, 25, 10, 10, 10);  //9
    rect(width/2-45, 25, 10, 10, 10);  //10
    UIHealth();

    if (score < 0 || player.health == 0)
    {
      gamestate = 4;
    }
  }

  void gameOver()
  {
    textSize(30);
    fill(0);    
    textAlign(CENTER, CENTER);
    text("Game over", width/2, height/2 - 50);
    text("Final Time: " +timer.getRemainingTime(), width/2, height/2 );
    gamestate = 0;
  }



  void UIHealth() {

    if (player.health <= 9)
    {
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rect(width/2+45, 25, 10, 10, 10);
      if (player.health <= 8)
      {
        rect(width/2+35, 25, 10, 10, 10);
      } 
      if (player.health <= 7)
      {
        rect(width/2+25, 25, 10, 10, 10);
      } 
      if (player.health <= 6)
      {
        rect(width/2+15, 25, 10, 10, 10);
      } 
      if (player.health <= 5)
      {
        rect(width/2+5, 25, 10, 10, 10);
      } 
      if (player.health <= 4)
      {
        rect(width/2-5, 25, 10, 10, 10);
      } 
      if (player.health <= 3)
      {
        rect(width/2-15, 25, 10, 10, 10);
      } 
      if (player.health <= 2)
      {
        rect(width/2-25, 25, 10, 10, 10);
      } 
      if (player.health <= 1)
      {
        rect(width/2-35, 25, 10, 10, 10);
      }
      if (player.health == 0)
      {
        rect(width/2-45, 25, 10, 10, 10);
      }
    }
  }

  void levelUp()
  {
    if (timer.getRemainingTime() % 60 == 0)
    {
      textAlign(CENTER, CENTER);
      textSize(50);
      text("Level Up", width/2, 200);
      level++;
    }
  }
}
