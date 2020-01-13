Cell [][] grid;
int nmCounter;//Not Mine Counter
boolean game;
boolean won;

void setup(){
  won=false;
  textSize(30);
  background(100,50,50);
  float x=0;
  float y=height/2-360;
  grid = new Cell[8][8];
  game=true;
  
  for(int i=0; i<8;i++){
    for(int j=0;j<8;j++){
      grid[i][j] = new Cell(x,y);
      if(grid[i][j].chance>0){
        nmCounter++;
      }
      x+=90;
    }
    y+=90;
    x=0;
  } 
  println(nmCounter);
}
void draw(){
  
}
void mousePressed(){
  
  if(game){
  for(int i=0; i<8;i++){
    for(int j=0;j<8;j++){
      float distX=abs(mouseX-grid[i][j].centerX);
      float distY=abs(mouseY-grid[i][j].centerY);
      
      if(distX<61.25 && distY<61.25 && !grid[i][j].revealed){
        grid[i][j].reveal();
        nmCounter--;     
        println(nmCounter);
        if(grid[i][j].chance <5 && grid[i][j].chance>0){
          countNeighbors(i,j);
          fill(255);
          text(grid[i][j].mineCounter,         
          grid[i][j].centerX, grid[i][j].centerY);
          if(nmCounter==0){
            won=true;
            gOver();
            println("");
          }
        }
        else if(grid[i][j].chance==0){
          gOver();
        }
      }
    }
  }
 }
  else{
    tryAgain();
  }
}
void tryAgain(){
  won=false;
  textSize(30);
  background(100,50,50);
  float x=0;
  float y=height/2-360;
  grid = new Cell[8][8];
  game=true;
  nmCounter=0;
  for(int i=0; i<8;i++){
    for(int j=0;j<8;j++){
      grid[i][j] = new Cell(x,y);
      if(grid[i][j].chance>0){
        nmCounter++;
      }
      x+=90;
    }
    y+=90;
    x=0;
  }
  loop();
}
void countNeighbors(int i, int j){
  for (int k=-1;k<2;k++){
    for(int l=-1;l<2;l++){
      if(i-k<8 && i-k>=0 && j-l<8 && j-l>=0){
        if(grid[i-k][j-l].chance==0){
          grid[i][j].mineCounter++;
        }
      }
    }
  }
}

void gOver(){
  for(int i =0;i<8;i++){
    for(int j=0;j<8;j++){
      grid[i][j].reveal();
      textSize(60);
      fill(255);
      stroke(255);
      if(!won)
      text("¿Quieres otra vez?", 0, 1000);
      else
      text("Rifado, 10/10", 0,1000);
      game=false;
      noLoop();
    }
  }
}
