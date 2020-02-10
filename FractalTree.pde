private double fractionLength = .7; 
private int smallestBranch = 10; 
private double branchAngle = .3;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,340);   
	drawBranches(320,340,140,3*Math.PI/2); 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	angle1 = angle+branchAngle;
	angle2 = angle-branchAngle;

	branchLength *= fractionLength;

	int endX1, endY1, endX2, endY2;
	endX1 = (int)(x+branchLength*Math.cos(angle1));
	endY1 = (int)(y+branchLength*Math.sin(angle1));
	endX2 = (int)(x+branchLength*Math.cos(angle2));
	endY2 = (int)(y+branchLength*Math.sin(angle2));

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if (branchLength>=smallestBranch) {
		drawBranches(endX1,endY1,branchLength,angle1/*+PI/10*/);
		drawBranches(endX2,endY2,branchLength,angle2/*-PI/10*/);
	}

} 
