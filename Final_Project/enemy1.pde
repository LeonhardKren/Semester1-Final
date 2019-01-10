class Enemy1
{
  float attackX[][] = new float[5][5];
  float attackY[][] = new float[5][5];
  int AttackNumber;

  Enemy1()
  {
    noStroke();
    AttackNumber = 0;
    for (int j = 0; j<5; j++)
    {
      for (int i = 0; i<5; i++)
      {
        attackX[i][j]=0;
        attackY[i][j]=random(225, 525);
      }
    }
    if(AttackNumber == 10)
    {
     Scene=1; 
    }
  }
  void Reset()
  {
       AttackNumber = 0;
    for (int j = 0; j<5; j++)
    {
      for (int i = 0; i<5; i++)
      {
        attackX[i][j]=0;
        attackY[i][j]=random(225, 525);
      }
    } 
  }

  void Attack()
  {
    fill(255, 255, 255);
    if (AttackNumber==5)
    {
      for (int j = 0; j<AttackNumber; j++)
      {
        for (int i=0; i<5; i++)
        {
          rect(attackX[i][j], attackY[i][j], 30, 30);
          attackY[i][j]+=5;
        }
      }
    } else
    {
      for (int j=0; j<AttackNumber; j++)
      {
        for (int i = 0; i<5; i++)
        {
          rect(attackX[i][j], attackY[i][j], 30, 30);
          attackX[i][j]+=5;
        }
      }
    }
  }
  void ChangeAttack()
  {
    for (int j = 0; j<AttackNumber; j++)
    {
      for (int i=0; i<5; i++)
      {
        attackX[i][j]=random(525, 875);
        attackY[i][j]=0-100*j;
      }
    }
  }

  void Collisions()
  {
    for (int j = 0; j<AttackNumber; j++)
    {
      for (int i=0; i<5; i++)
      {
        if(dist(fightX+15,fightY+15,attackX[i][j],attackY[i][j])<5)
        {
          Scene=3; 
        }
      }
    }    
  }
} 
