private double fractionLength = .85; 
public int smallestBranch = 30; 
private double branchAngle = .5;  

boolean MousePressed = false;
  public void mousePressed(){
    if(smallestBranch >= 2){
      smallestBranch--;
      redraw();
    } 
  }

tree[]forest = new tree[5];

public void setup() 
{   
  size(900,700);    
  noLoop();  
  
  for(int i = 0; i < 5; i++){
    forest[i] = new tree();
  }
  
  
} 
public void draw() 
{   
  background(245, 250, 250);      
  
 
 int sizX = 250;
 int sizY = 150;
  boolean shift = true;
for(int n = -800; n < 800; n = n+sizX){
  for(int i = 0; i < forest.length; i++){
    if(shift == true){
     forest[i].makeline((i*sizX) + n , (i * sizY));
     forest[i].trees((i*sizX) + n , (i * sizY), 35.0, (3*Math.PI/2));
    } else{
      forest[i].makeline((i*sizX) + n, (i * sizY)+sizY/2);
     forest[i].trees((i*sizX) + n, (i * sizY)+sizY/2, 30.0, (3*Math.PI/2));
    }
    if(shift == true){
      shift = false;
    } else{
      shift = true;
    }
  }
}

}

public class tree{
  void makeline(int x, int y){
    stroke(5, (int)y/3, 0);
      line(x, y, x, y+100);
  }
  void trees(int x,int y, double branchLength, double angle) 
{   
  
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;

  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  stroke((int)branchLength/3, (int)y/3, 0);
  line(x, y, endX1, endY1);
  stroke((int)branchLength/2, (int)y/2, 0);
  line(x, y, endX2, endY2);
    
  if((branchLength > smallestBranch)){
    trees(endX1, endY1, branchLength, angle1);
    trees(endX2, endY2, branchLength, angle2);
  
  }
} 

}
