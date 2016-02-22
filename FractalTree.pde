private double fractionLength = 0.5; 
private int smallestBranch = 1; 
private double branchAngle = 0.2; 
private int startX=320;
private int startY=380; 
private double agl=3*Math.PI/2;
public void setup() 
{   
	size(640,480);    
} 
public void keyPressed()
{
	if (keyCode==' ')
	branchAngle+=0.05;
	if (keyCode=='a')
	smallestBranch++;
}

public void draw() 
{   
	keyTyped();
	background(0); 
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(startX,startY,300,agl);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
float angle1=(float)angle+(float)branchAngle;
float angle2=(float)angle-(float)branchAngle;
branchLength*=fractionLength;
int endX1 = (int)(branchLength*Math.cos(angle1)+x);
int endY1 = (int)(branchLength*Math.sin(angle1)+y);
int endX2 = (int)(branchLength*Math.cos(angle2)+x);
int endY2 = (int)(branchLength*Math.sin(angle2)+y);
line((float)x,(float)y,(float)endX1,(float)endY1);
line((float)x,(float)y,(float)endX2,(float)endY2);
if (branchLength>=smallestBranch){
 drawBranches((int)endX1,(int)endY1,branchLength,angle1++);
 drawBranches((int)endX2,(int)endY2,branchLength,angle2++);
//line((float)x,(float)y,(float)x+(float)endX1,(float)y-(float)endY1);
//line((float)x,(float)y,(float)x-(float)endX1,(float)y-(float)endY1);
 } 
else 
 {
//line((float)x,(float)y,(float)endX1,(float)endY1);
//line((float)x,(float)y,(float)endX2,(float)endY2);
//drawBranches((int)x+(int)endX1,(int)y-(int)endY1,(branchLength/2)*fractionLength,angle/2);

 }
  System.out.println(endX1 + "," + endY1 + ","+ endX2 + "," + endY2 + "," + agl);
}
