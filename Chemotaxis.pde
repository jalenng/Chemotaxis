int BACTERIA_WIDTH = 10;
Bacteria[] data = new Bacteria[10];   

 void setup()   
 {
 	size(300, 300);
 	for (int i = 0; i < data.length; i++)
 	{
 		data[i] = new Bacteria(0, 0);
 	}
 }   
 void draw()   
 {    
 	//move and show the bacteria   
 }  
 class Bacteria    
 {     
 	int myX, myY, myColor;
 	int[] prevX, prevY;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		//`myColor = col;
 	}
 	void walk()
 	{
 		//myX = 
 	}
 	void show()
 	{
 		for (int i = 0; i < prevX.length; i++)
 		{
 			ellipse(prevX[i], prevY[i], BACTERIA_WIDTH, BACTERIA_WIDTH);
 		}
 	}
 }    