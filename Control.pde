class control
{
  private int howToPage;
  private PImage theControls = loadImage("theControls.png");
  private PImage page3 = loadImage("Page3.png");
  private int buttonCooldown =60;

  void render()
  {
    if (buttonCooldown >= 1) {
      buttonCooldown--;
    }
    println(buttonCooldown);
    if (howToPage == 0)
    {
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(0);
      text("Menu", width/2, 615); 
      image(theControls, 0, -50);
      fill(43.1, 100, 96.5);
      triangle(width/2+100, 643, width/2+100, 598, 650, 620);
    } else if (howToPage == 1)
    {
      fill(0);
      textSize(50);
      text("Menu", width/2, 615);
      textSize(40);
      text("Welcome to the Island of the Crab King!", width/2, 30);
      textSize(30);
      text("This Island is overrun with crabs on account of the large amounts", width/2, 70);
      text("of kelp that grows on the island, but you used to be their king", width/2, 110);
      text("cast out they are searching for you. All you must do is survive in", width/2, 150);
      text("this quiet section of the island and try to survive as long as", width/2, 190);
      text("possible. There are dangers here however, Night furies take flight", width/2, 230);
      text("over this section of the island not to mention all the crabs you", width/2, 270);
      text("once cast out of your kingdom who will try and get their revenge.", width/2, 310);
      textSize(40);
      text("How long can you survive?", width/2, 390);
      fill(43.1, 100, 96.5);
      triangle(width/2+100, 643, width/2+100, 598, 650, 620);
      triangle(width/2-100, 643, width/2-100, 598, 350, 620);
    } else if (howToPage == 2)
    {
      page3.resize(800, 600);
      image(page3, 100, 50);
      textSize(50);
      fill(0);
      text("Menu", width/2, 615);
      fill(43.1, 100, 96.5);
      triangle(width/2-100, 643, width/2-100, 598, 350, 620);
    }
    mouseClicks();
  }

  void mouseClicks()
  {
    if (
      mouseX <= 574 && mouseX >= 432 &&
      mouseY <= 643 && mouseY >= 598 && 
      mousePressed == true)
    {
      gamestate = 1;
      buttonCooldown = 15;
    } 
    if (
      mouseX <= 650 && mouseX >= 600 &&
      mouseY <= 643 && mouseY >= 598 &&
      mousePressed == true && howToPage == 0
      && buttonCooldown == 0)
    {
      howToPage = 1;
      buttonCooldown = 15;
    } 
    if (
      mouseX <= 400 && mouseX >= 350 &&
      mouseY <= 643 && mouseY >= 598 &&
      mousePressed == true && howToPage == 1
      && buttonCooldown == 0)
    {
      howToPage = 0;
      buttonCooldown = 15;
    }
    if (
      mouseX <= 650 && mouseX >= 600 &&
      mouseY <= 643 && mouseY >= 598 &&
      mousePressed == true && howToPage == 1
      && buttonCooldown == 0)
    {
      howToPage = 2;
      buttonCooldown = 15;
    } 
    if (
      mouseX <= 400 && mouseX >= 350 &&
      mouseY <= 643 && mouseY >= 598 &&
      mousePressed == true && howToPage == 2
      && buttonCooldown == 0)
    {
      howToPage = 1;
      buttonCooldown = 15;
    }
  }
}
