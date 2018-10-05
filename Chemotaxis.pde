int BACTERIA_WIDTH = 10;
Bacteria[] colony = new Bacteria[1];   

void setup()   
{
	size(500, 500);
	background(255);
	frameRate(60);
	for (int i = 0; i < colony.length; i++)
	{
		colony[i] = new Bacteria((int)(Math.random() * width), 
			                     (int)(Math.random() * height));
	}
}   
void draw()
{    
	fill(255, 255, 255, 10);
	rect(0, 0, width, height);
	for (int i = 0; i < colony.length; i++)
	{
		colony[i].walk();
		colony[i].show();
		colony[i].updateBias();
	}
  
}  
class Bacteria    
{     
	int myX, myY;
	color myColor;
	int myXBias, myYBias;
	Bacteria(int x, int y)
	{
		myX = x;
		myY = y;
		myColor = color((int)(Math.random() * 256), 
			            (int)(Math.random() * 256), 
			            (int)(Math.random() * 256), 255);
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
		double distFromMouse = (Math.sqrt(sq(horDistFromMouse) + sq(vertDistFromMouse)));
		double angleFromMouse;
		if (horDistFromMouse == 0) {
			if (vertDistFromMouse > 0)
				angleFromMouse = PI / 2;
			else 
				angleFromMouse = - PI / 2;
		} else {
			angleFromMouse = Math.atan(vertDistFromMouse / horDistFromMouse);
		}
		
		myXBias = (int)(distFromMouse * Math.cos(angleFromMouse) / (BACTERIA_WIDTH * 10));
		myYBias = (int)(distFromMouse * Math.sin(angleFromMouse) / (BACTERIA_WIDTH * 10));

		println("horDistFromMouse: "+horDistFromMouse);
		println("vertDistFromMouse: "+vertDistFromMouse);
		println("distFromMouse: "+distFromMouse);
		println("angleFromMouse: "+angleFromMouse);
	}
	void show()
	{
		noStroke();
		fill(myColor);
		ellipse(myX, myY, BACTERIA_WIDTH, BACTERIA_WIDTH);
	}
}    