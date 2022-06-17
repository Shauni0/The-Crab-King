class TitleScreenSelector
{  
  //classes
  private int backgroundX = 0;
  private PImage background = loadImage("background.png");
  private PImage text = loadImage("TitleScreen.png");

  //This places the Title Screen Text
  void rendertext()  
  {
    image(text, 0, 0);
  }

  void drawBackground() {
    background(62, 120, 220);
    image(background, backgroundX, 0); //fraw background

    //wraps background
    backgroundX -= 1; //moves it to the left
    if (backgroundX == -1000)
    {
      backgroundX = 1000;
    }
  }
  //this allows the text when clicked to change the game state to the desired one
  void titleScreenOptions()
  {
    //click on play to change Gamestate
    if (mouseX <= 562 && mouseX >= 422 && mouseY <= 413 && mouseY >= 356 && mousePressed == true)
    {
      gamestate = 3;
    }
    //click on how to play to change gamestate
    else if (mouseX <= 687 && mouseX >= 317 && mouseY <= 512 && mouseY >= 455 && mousePressed == true)
    {
      gamestate = 2;
    }
    //click on exit to close application
    else if (mouseX <= 559 && mouseX >= 448 && mouseY <= 587 && mouseY >= 541 && mousePressed == true)
    {
      exit();
    }
  }
}
