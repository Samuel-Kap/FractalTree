private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,600);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,580,320,480);   
	drawBranches(320,480,100,3*Math.PI/2);  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double a1=angle+branchAngle;
  double a2=angle-branchAngle;
  int endX1 = (int)(branchLength*Math.cos(a1) + x);
  int endY1 = (int)(branchLength*Math.sin(a1) + y);
  int endX2 = (int)(branchLength*Math.cos(a2) + x);
  int endY2 = (int)(branchLength*Math.sin(a2) + y);
  branchLength=branchLength*fractionLength;
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1,endY1,branchLength,a2+.5);
    drawBranches(endX2,endY2,branchLength,a1-.5);
  }
} 
