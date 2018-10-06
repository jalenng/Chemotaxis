int BACTERIA_WIDTH = 50;
int backgroundBrightness = 255;
Bacteria[] colony = new Bacteria[50];   
boolean isFollowingMouse = false;

void setup()   
{
	size(500, 500);
	frameRate(60);
	for (int i = 0; i < colony.length; i++)
	{
		colony[i] = new Bacteria((int)(Math.random() * width), 
			                     (int)(Math.random() * height));
	}
}

void draw()
{    
	fill(backgroundBrightness, backgroundBrightness, backgroundBrightness, 10);
	rect(0, 0, width, height);
	for (int i = 0; i < colony.length; i++)
	{
		colony[i].walk();
		colony[i].show();
		if (isFollowingMouse)
			colony[i].updateBias();
	}
}

void mousePressed()
{
	if (isFollowingMouse)
	{
		isFollowingMouse = false;
		backgroundBrightness = 255;
		setup();
	}
	else
	{
		isFollowingMouse = true;
		backgroundBrightness = 0;
	}
}

class Bacteria    
{     
	int myX, myY;
	color myColor;
	double myXBias, myYBias;
	Bacteria(int x, int y)
	{
		myX = x;
		myY = y;
		myColor = color((int)(Math.random() * 256), 
			            (int)(Math.random() * 256), 
			            (int)(Math.random() * 256), 10);
	}
	void walk()
	{
		myX += (int)(Math.random() * 7) - 3 + myXBias;
		myY += (int)(Math.random() * 7) - 3 + myYBias;
	}
	void updateBias()
	{
		int horDistFromMouse = mouseX - myX;
		int vertDistFromMouse = mouseY - myY;
		double distFromMouse = (double)(Math.sqrt(sq(horDistFromMouse) + sq(vertDistFromMouse)));
		double angleFromMouse;
		if (horDistFromMouse == 0) {
			if (vertDistFromMouse > 0)
				angleFromMouse = PI / 2;
			else 
				angleFromMouse = - PI / 2;
		} else {
			angleFromMouse = Math.atan2(vertDistFromMouse, horDistFromMouse);
		}
		
		myXBias = (distFromMouse * Math.cos(angleFromMouse) / (BACTERIA_WIDTH * 1));
		myYBias = (distFromMouse * Math.sin(angleFromMouse) / (BACTERIA_WIDTH * 1));

		println("angleFromMouse: "+angleFromMouse * 57.2958);
		println("myXBias: "+myXBias);
		println("myYBias: "+myYBias);
	}
	void show()
	{
		noStroke();
		fill(myColor);
		ellipse(myX, myY, BACTERIA_WIDTH, BACTERIA_WIDTH);
	}
}    