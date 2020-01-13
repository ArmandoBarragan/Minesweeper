class Cell{
  float x, y, width, centerX, centerY;
  boolean revealed;
  int chance;
  int mineCounter;
  
  public Cell(float x,float y){
    mineCounter=0;
    this.x=x;
    this.y=y;
    width =90;
    revealed=false;
    chance= (int)floor(random(5));
    //0 = mina, 1=número, 6 = nada
    centerX = x+width/2;
    centerY = y+width/2;
    
    fill(255);
    stroke(0);
    rect(x,y,width,width);
  }
  
  void reveal(){
    if(chance==0){
      fill(150);
      stroke(255);
      rect(x,y,width, width);
      fill(255);
      stroke(0);
      ellipse(centerX, centerY, 60,60);
    } 
    else if(chance<7){
      fill(143,200,143);
      stroke(255);
      rect(x,y,width, width); 
    }
    else{
      fill(180,200,143);
      stroke(255);
      rect(x,y,width, width);
    }
    revealed=true;
  }
}
