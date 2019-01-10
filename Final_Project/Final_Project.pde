//PImage WalkingSprite;
//PImage Walking[] = new PImage[16];
//int WalkingFrame=8;
//int sx=0;
//int sy=0;
//int FH=0;
//int FW=0;
//int lastFramTime=0;
PImage Character;
int Scene=1;
PImage Corridor;
PImage Soul;
float playerX = 0;
float playerY = 320;
float fightX = 700;
float fightY = 300;
float BonusY=0;
float BonusX=0;
boolean left, right, up, down = false;
int Time=-1;
int AttackTime = -1;
float EnemiesX[] = new float[7];
float EnemiesY[] = new float[7];
int Speed = 1;
Enemy1 enemy1;

void setup()
{
  size(1400, 600);
  Corridor=loadImage("Corridor.png");
  Corridor.resize(1400, 600);
  //WalkingSprite=loadImage("Sprite copy.png"); 
  //WalkingSprite.resize(118,236);
  Character=loadImage("Character.png");
  Character.resize(119, 125);
  Soul=loadImage("Soul.png");
  Soul.resize(30, 30);
  enemy1 = new Enemy1();
  for (int i=0; i<7; i++)
  {
    EnemiesX[0] = 250;
    EnemiesX[1] = 390;
    EnemiesX[2] = 530;
    EnemiesX[3] = 670;
    EnemiesX[4] = 810;
    EnemiesX[5] = 950;
    EnemiesX[6] = 1090;
    EnemiesY[i] = random(360, 600);
  }
}
void draw()
{
  if (Scene==1)
  {
    SceneOne();
  }
  if (Scene==2)
  {
    fight();
  }
  if (Scene==3)
  {
    Lose();
  }
  if(Scene==4)
  {
   Win(); 
  }
}
void SceneOne()
{
  background(Corridor);
  //rect(playerX,playerY,20,20);
  image(Character, playerX, playerY);
  MoveChar();
  for (int i=0; i<7; i++)
  {
    rect(EnemiesX[i], EnemiesY[i], 40, 40);
    EnemiesY[i]+=Speed;
    if(EnemiesY[i]>height)
    {
      Speed=Speed *-1;
    }
    if(EnemiesY[i]<360)
    {
     Speed=Speed*-1;
    }
    if(dist(playerX+60,playerY+60,EnemiesX[i],EnemiesY[i])<35)
    {
     Scene=2; 
    }
    } 
    if (playerX<1300)
    {
      if (playerY<360)
      {
        playerY+=2;
      }
    }
  // entering door
  if (playerX<1330)
  {
    if (playerX>1300)
    {
      if (playerY<360)
      {
        Scene=4;
      }
    }
  }
}

void Lose()
{
  background(0, 0, 0);
  fill(255, 255, 255);
  textSize(50);
  text("You lose!", 600, 350);
}
void Win()
{
   background(0, 0, 0);
  fill(255, 255, 255);
  textSize(50);
  text("You Win!", 600, 350); 
}

//void Walking()
//{
//  FH=WalkingSprite.height/4;
//  FW=WalkingSprite.width/4;
//  sx=(WalkingFrame%4)*FW;
//  sy=(WalkingFrame/4)*FH;
//  image(WalkingSprite, playerX, playerY, FW, FH, sx, sy, 59, 350);
//  println(FH);

//  if (WalkingFrame<11)
//  {
//    if (millis()-lastFramTime>1000)
//    {
//      WalkingFrame+=1;
//      lastFramTime=millis();
//    }
//  } else
//  {
//    WalkingFrame=1;
//  }
//}

void fight()
{
  background(0, 0, 0);
  fill(255, 255, 255);
  rect(500, 200, 400, 400);
  fill(0, 0, 0);
  rect(525, 225, 350, 350);
  image(Soul, fightX, fightY);
  MoveChar();
  enemy1.Attack();
  enemy1.Collisions();
  if (millis() - AttackTime > 1000)
  {
    AttackTime = millis();
    if (enemy1.AttackNumber==4)
    {
      enemy1.ChangeAttack();
    }
    enemy1.AttackNumber++;       
    if (enemy1.AttackNumber>5)
    {
      enemy1.AttackNumber=0;
      Scene = 1;
      enemy1.Reset();
      playerX=0;
      playerY=320;
    }
  }
  if (fightX<525)
  {
    fightX+=4;
  }
  if (fightX>848)
  {
    fightX-=4;
  }
  if (fightY>545)
  {
    fightY-=4;
  }
  if (fightY<225)
  {
    fightY+=4;
  }
}
void MoveChar()
{
  if (Scene==1)
  {
    if (right)
    {
      playerX+=2 + BonusX;
    }
    if (left)
    {
      playerX-=2+BonusX;
    }
    if (up)
    {
      playerY-=2+BonusY;
    }
    if (down)
    {
      playerY+=2+BonusY;
    }
  }
  if (Scene==2)
  {
    if (right)
    {
      fightX+=2;
    }
    if (left)
    {
      fightX-=2;
    }
    if (up)
    {
      fightY-=2;
    }
    if (down)
    {
      fightY+=2;
    }
  }
}
void keyPressed()
{
  if (keyCode==RIGHT)
  {
    right=true;
  }
  if (keyCode==LEFT)
  {
    left=true;
  }
  if (keyCode==UP)
  {
    up=true;
  }
  if (keyCode==DOWN)
  {
    down=true;
  }
}
void keyReleased()
{
  if (keyCode==RIGHT)
  {
    right=false;
  }
  if (keyCode==LEFT)
  {
    left=false;
  }
  if (keyCode==UP)
  {
    up=false;
  }
  if (keyCode==DOWN)
  {
    down=false;
  }
}
