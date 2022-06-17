import processing.sound.*; //<>//

SoundFile GameMusic;
cloud cloud;
Player player;
LandCrab Crab;
BirdCrab BirdCrab;
score ScoreTimeDisplay;
score gameOver;
TitleScreenSelector Title;
control control;
CountDown CountDown;
CountDown timer;
Food Food;
Health Health;

//Variables
public int gamestate = 1; 
private int spawnTimer;
private int LandCrabSpawnRate = 100;
private int BirdCrabSpawnRate = 200;

//ArrayLists
ArrayList<Food> foodList = new ArrayList();
ArrayList<Health> healthList = new ArrayList();
ArrayList<BirdCrab> BirdCrabList = new ArrayList();
ArrayList<LandCrab> LandCrabList = new ArrayList();

/*
Possible Game States
 1 = Title Screen
 2 = how to or control screen
 3 = the actual game
 4 = a game over screen
 5 = a Pause screen
 */

void setup()
{
  size(1000, 700);
  player = new Player (width/2, height/2 );
  ScoreTimeDisplay = new score();
  foodList.add (new Food (height, width));
  Title = new TitleScreenSelector();
  cloud = new cloud();
  timer = new CountDown(0);
  control = new control();
  //Food = new renderFood();
  GameMusic = new SoundFile(this, "BeachDayLoop.wav");
  //beachdayloop = new SoundFile(this, "BeachDayLoop.wav");
      GameMusic.play();
      GameMusic.loop();
}

void draw()
{
  if (gamestate == 1)
  {
    Title.drawBackground();
    cloud.drawCloud();
    Title.rendertext();
    Title.titleScreenOptions();
  }
  if (gamestate == 2)
  {
    Title.drawBackground();
    cloud.drawCloud();
    control.render();
  }
  if (gamestate == 3)
  {
    background(237, 201, 175);
    player.render();
    addingFood();
    addingHealth();
    addingLandCrab();
    addingBirdCrabs();
    ScoreTimeDisplay.ScoreTimeDisplay();
    spawnTimer++;
    ScoreTimeDisplay.levelUp();
  }
  if (gamestate == 4)
  {
    ScoreTimeDisplay.gameOver();
  }
}

// add Bird Crab
void addingBirdCrabs() {
  for ( BirdCrab BC : BirdCrabList) {
    BC.renderBirdCrab();
  }
  if (spawnTimer % BirdCrabSpawnRate == 0) {
    BirdCrabList.add( new BirdCrab(-60, (int)random(60, height-50)));
  }
  //Goodbye Bird
  for (int i = 0; i<BirdCrabList.size(); i++)
  {
    BirdCrab BC = BirdCrabList.get(i);
    if (BC.x > width)
    {
      BirdCrabList.remove(i);
    } else {
      if (
        player.x <= BC.x + 50 && player.x + 50 >= BC.x &&
        player.y <= BC.y + 100 && player.y + 30 >= BC.y
        ) {
        player.health --;
        BirdCrabList.remove(i);
      }
    }
  }
}

//add Land Crab
void addingLandCrab() {
  for (LandCrab LC : LandCrabList) {
    LC.renderLandCrab();
    LC.crabMovement();
  }
  if (spawnTimer % LandCrabSpawnRate == 0) {
    LandCrabList.add( new LandCrab((int)random(20, width-20), (int)random(60, height-20)));
  }
  //Goodbye Crab
  for (int i = 0; i<LandCrabList.size(); i++)
  {
    LandCrab LC = LandCrabList.get(i);
    if (
      LC.x <= player.x + 50 && LC.x + 30 >= player.x &&
      LC.y <= player.y + 50 && LC.y + 30 >= player.y
      ) {
      LandCrabList.remove(i);
      player.health--;
    } else {
      for ( BirdCrab BC : BirdCrabList) {
        if (
          LC.x <= BC.x + 50 && LC.x + 30 >= BC.x &&
          LC.y <= BC.y + 100 && LC.y + 30 >= BC.y
          ) {
          LandCrabList.remove(i);
        }
      }
    }
  }
}

//Adding Food
void addingFood() {
  for (Food F : foodList) {
    F.renderFood();
  }
  if ( spawnTimer % 50 == 0 ) { // spawnrate
    foodList.add( new Food ((int)random(50, width-50), (int)random(65, height-50)) );
  }
  //collisions
  for (int i = 0; i< foodList.size(); i++) {
    Food Food = foodList.get(i);
    if (
      Food.x <= player.x + 50 && Food.x + 20 >= player.x && 
      Food.y <= player.y + 50 && Food.y + 20 >= player.y
      ) {
      foodList.remove(i);
      ScoreTimeDisplay.score = ScoreTimeDisplay.score + 150 ;
      player.RecoverHealth ++;
    } else {
      for ( BirdCrab BC : BirdCrabList) {
        if (
          Food.x <= BC.x + 50 && Food.x + 20 >= BC.x && 
          Food.y <= BC.y + 100 && Food.y + 20 >= BC.y
          ) {
          foodList.remove(i);
        }
      }
    } 
    {
      for ( LandCrab LC : LandCrabList) {
        if (
          Food.x <= LC.x + 30 && Food.x + 20 >= LC.x &&
          Food.y <= LC.y + 30 && Food.y + 20 >= LC.x
          ) {
          foodList.remove(i);
        }
      }
    }
  }
}

//adding Health
void addingHealth() {
  for (Health H : healthList) {
    H.renderHealth();
  }
  if ( spawnTimer % 750 == 0 ) { // spawnrate
    healthList.add( new Health ((int)random(50, width-50), (int)random(65, height-50)) );
  }
  //collisions
  for (int i = 0; i< healthList.size(); i++) {
    Health Health = healthList.get(i);
    if (
      Health.x <= player.x + 50 && Health.x + 20 >= player.x && 
      Health.y <= player.y + 50 && Health.y + 20 >= player.y
      ) {
      healthList.remove(i);
      ScoreTimeDisplay.score = ScoreTimeDisplay.score + 150 ;
      player.RecoverHealth = + 10;
    }
  }
}
