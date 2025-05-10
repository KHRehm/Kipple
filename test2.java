//
//   Create a sequence of Java 2D graphics into png files 
//   
//

 
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.AlphaComposite;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random.*;
import java.lang.Math.*;
import javax.imageio.ImageIO;
import java.util.Random;

public class test2 {

    public static double pDir(double ip) {
	if (ip < 0.5) return -1.0;
	return 1.0;
    }


    public static double Distance(double x1,double y1,double x2,double y2) {  
	double ac = Math.abs(y2 - y1);
	double cb = Math.abs(x2 - x1);
	
	return Math.hypot(ac, cb);
    }

    
    Random random = new Random(System.currentTimeMillis());

    int xR = random.nextInt();  //limit this -Huge < xR < Huge
    int xRMod = random.nextInt(6); //0<x<6
    double yy = random.nextDouble(); //0..1.0
    boolean bR = random.nextBoolean();
    
    public static final Color BLACK = Color.BLACK;
    public static final Color BLUE = Color.BLUE;
    public static final Color CYAN = Color.CYAN;
    public static final Color DARK_GRAY = Color.DARK_GRAY;
    public static final Color GRAY = Color.GRAY;
    public static final Color GREEN  = Color.GREEN;
    public static final Color LIGHT_GRAY = Color.LIGHT_GRAY;
    public static final Color MAGENTA = Color.MAGENTA;
    public static final Color ORANGE = Color.ORANGE;
    public static final Color PINK = Color.PINK;
    public static final Color RED = Color.RED;
    public static final Color WHITE = Color.WHITE;
    public static final Color YELLOW = Color.YELLOW;
    public static final Color BOOK_BLUE = new Color(9, 90, 166);
    public static final Color BOOK_LIGHT_BLUE = new Color(103, 198, 243);
    public static final Color BOOK_RED = new Color(150, 35, 31);
    public static final Color PRINCETON_ORANGE = new Color(245, 128, 37);
    public static final Color GRAY_V00 = new Color(0, 0, 0);
    public static final Color GRAY_V01 = new Color(15, 15, 15);
    public static final Color GRAY_V02 = new Color(30, 30, 30);
    public static final Color GRAY_V03 = new Color(45, 45, 45);
    public static final Color GRAY_V04 = new Color(60, 60, 60);
    public static final Color GRAY_V05 = new Color(75, 75, 75);
    public static final Color GRAY_V06 = new Color(90, 90, 90);
    public static final Color GRAY_V07 = new Color(105, 105, 105);
    public static final Color GRAY_V08 = new Color(120, 120, 120);
    public static final Color GRAY_V09 = new Color(135, 135, 135);
    public static final Color GRAY_V10 = new Color(150, 150, 150);
    public static final Color GRAY_V11 = new Color(165, 165, 165);
    public static final Color GRAY_V12 = new Color(180, 180, 180);
    public static final Color GRAY_V13 = new Color(195, 195, 195);
    public static final Color GRAY_V14 = new Color(210, 210, 210);
    public static final Color GRAY_V15 = new Color(225, 225, 225);
    public static final Color GRAY_V16 = new Color(240, 240, 240);
    public static final Color GRAY_V17 = new Color(255, 255, 255);

    

    public static void main(String[] args) throws IOException {
 
        int width = 1920;
	int width2 = width*2;
        int height = 1080;
	int widthHalf = width/2;
	int heightHalf = height/2;
	int framesPerSec = 25;
	int secPerMin = 60;
	int framesPerMin =  framesPerSec*secPerMin;
	int minutesTotal = 2;
	String s1 = "b";
	String fNameSuffix = ".png";

	int rectCount = 48;
	int rectLength = 300;
	int rectWidth = 300;
	int rectArea = rectLength * rectWidth;
	int rectCenterX = widthHalf - rectWidth/2;
	int rectCenterY = heightHalf - rectLength/2;

	int rectPtsN = 4;
	
	//g2d.drawPolygon(rectX(),rectY(),rectPtsN);


	int[][] rectX = new int[rectCount][rectPtsN];
	int[][] rectY = new int[rectCount][rectPtsN];
	
	
	for (int i = 0; i < rectCount; i++) {

		double  rLX = Math.random()/Math.nextDown(1.0);
		double  rL  = (rectLength/10.0)*(1.0 - rLX) + (rectLength)*rLX;
		double  rWX = Math.random()/Math.nextDown(1.0);
		double  rW  = (rectWidth/10.0)*(1.0 - rWX) + (rectWidth)*rWX;
		
		int iX1 = rectCenterX-(int)rW/2;
		int iX2 = rectCenterX+(int)rW/2;
		int iX3 = rectCenterX+(int)rW/2;
		int iX4 = rectCenterX-(int)rW/2;
		int[] initPosX = {iX1,iX2,iX3,iX4};
		
		int iY1 = rectCenterY+(int)rL/2;
		int iY2 = rectCenterY+(int)rL/2;
		int iY3 = rectCenterY-(int)rL/2;
		int iY4 = rectCenterY-(int)rL/2;
		int[] initPosY = {iY1,iY2,iY3,iY4};


	    for (int j = 0; j < rectPtsN; j++) {

		
		if (i < 8) {
		    rectX[i][j] = initPosX[j]; 
		    rectY[i][j] = initPosY[j];
		}
		else if (i < 16) {
		    rectX[i][j] = initPosX[j] + 300; 
		    rectY[i][j] = initPosY[j] + 100;
		}
		else if (i < 24) {
		    rectX[i][j] = initPosX[j] + 200; 
		    rectY[i][j] = initPosY[j] - 170;
		}
		else if (i < 32) {
		    rectX[i][j] = initPosX[j] - 50; 
		    rectY[i][j] = initPosY[j] + 240;		    
		}
		else if (i < 40) {
		    rectX[i][j] = initPosX[j] + 260; 
		    rectY[i][j] = initPosY[j] - 150;
		}
		else if (i < 48) {
		    rectX[i][j] = initPosX[j] + 250; 
		    rectY[i][j] = initPosY[j] + 325;
		}
		
		
	    }
	}

	double[] signalT = new double[width2];
	int[] signalTI = new int[width2];
	double[][] signalArray = new double[17][width2];
	int[][] signalArrayI = new int[17][width2];
	double t = 0.0;				   


	double rTime  = Math.random()/Math.nextDown(1.0);
	double rTimeX = (minutesTotal*framesPerMin/12.0)*(1.0 - rTime) + (minutesTotal*framesPerMin/3.0)*rTime;



	
	for (int i = 1; i < (minutesTotal*framesPerMin) ; i++)
	    {

		StringBuilder sb = new StringBuilder(s1);
		String fileName = sb.append(i).append(fNameSuffix).toString();
		
		//System.out.println(fileName);

      		// Constructs a BufferedImage of one of the predefined image types.
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		// Create a graphics which can be used to draw into the buffered image
		Graphics2D g2d = bufferedImage.createGraphics();
		AlphaComposite alCom = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1.0f);
		g2d.setComposite(alCom);
		//g2d.setBackground(BLACK);
		g2d.clearRect(0,0,width,height);
		
		//		for (int j = 0; j < rectCount; j++)
		for (int j = 0; j < rectCount; j++)		    
		    {

			double dColorPick = Math.random()/Math.nextDown(1.0);
			dColorPick = dColorPick*17.0;
			int iColorPick = ((int)dColorPick) % 17; 


			iColorPick = j;
			if (iColorPick == 0)
			    {g2d.setColor(BLACK);}
			else if (iColorPick == 1)
			    {g2d.setColor(BLUE);}
			else if (iColorPick == 2)
			    {g2d.setColor(CYAN);}
			else if (iColorPick == 3)
			    {g2d.setColor(DARK_GRAY);}
			else if (iColorPick == 4)
			    {g2d.setColor(GRAY);}
			else if (iColorPick == 5)
			    {g2d.setColor(GREEN);}
			else if (iColorPick == 6)
			    {g2d.setColor(LIGHT_GRAY);}
			else if (iColorPick == 7)
			    {g2d.setColor(MAGENTA);}
			else if (iColorPick == 8)
			    {g2d.setColor(ORANGE);}
			else if (iColorPick == 9)
			    {g2d.setColor(PINK);}
			else if (iColorPick == 10)
			    {g2d.setColor(RED);}
			else if (iColorPick == 11)
			    {g2d.setColor(WHITE);}
			else if (iColorPick == 12)
			    {g2d.setColor(YELLOW);}
			else if (iColorPick == 13)
			    {g2d.setColor(BOOK_BLUE);}
			else if (iColorPick == 14)
			    {g2d.setColor(BOOK_LIGHT_BLUE);}
			else if (iColorPick == 15)
			    {g2d.setColor(BOOK_RED);}
			else if (iColorPick == 16)
			    {g2d.setColor(PRINCETON_ORANGE);}
			else
			    g2d.setColor(WHITE);



			if (j == 0) {
			    g2d.setColor(MAGENTA);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 1) {
			    g2d.setColor(BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 2) {
			    g2d.setColor(LIGHT_GRAY);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 3) {
			    g2d.setColor(RED);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 4) {
			    g2d.setColor(ORANGE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 5) {
			    g2d.setColor(BOOK_BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 6) {
			    g2d.setColor(PINK);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 7) {
			    g2d.setColor(PRINCETON_ORANGE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}

			else if (j == 8) {
			    g2d.setColor(GRAY_V03);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 9) {
			    g2d.setColor(GRAY_V07);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 10) {
			    g2d.setColor(GRAY_V12);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 11) {
			    g2d.setColor(BLACK);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 12) {
			    g2d.setColor(GRAY_V15);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 13) {
			    g2d.setColor(BOOK_LIGHT_BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 14) {
			    g2d.setColor(BOOK_RED);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 15) {
			    g2d.setColor(CYAN);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}

			else if (j == 16) {
			    g2d.setColor(GREEN);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 17) {
			    g2d.setColor(BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 18) {
			    g2d.setColor(RED);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 19) {
			    g2d.setColor(PINK);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 20) {
			    g2d.setColor(ORANGE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 21) {
			    g2d.setColor(BOOK_BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 22) {
			    g2d.setColor(MAGENTA);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 23) {
			    g2d.setColor(PRINCETON_ORANGE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}

			else if (j == 24) {
			    g2d.setColor(CYAN);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 25) {
			    g2d.setColor(BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 26) {
			    g2d.setColor(LIGHT_GRAY);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 27) {
			    g2d.setColor(RED);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 28) {
			    g2d.setColor(BOOK_LIGHT_BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 29) {
			    g2d.setColor(BOOK_BLUE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 30) {
			    g2d.setColor(PINK);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 31) {
			    g2d.setColor(YELLOW);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}

			else if (j == 32) {
			    g2d.setColor(GRAY_V03);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 33) {
			    g2d.setColor(GRAY_V07);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 34) {
			    g2d.setColor(GRAY_V06);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 35) {
			    g2d.setColor(GRAY_V11);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 36) {
			    g2d.setColor(GRAY_V05);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 37) {
			    g2d.setColor(GRAY_V12);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 38) {
			    g2d.setColor(GRAY_V04);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 39) {
			    g2d.setColor(GRAY_V13);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}

			else if (j == 40) {
			    g2d.setColor(GRAY_V03);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 41) {
			    g2d.setColor(GRAY_V14);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 42) {
			    g2d.setColor(GRAY_V02);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 43) {
			    g2d.setColor(GRAY_V15);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);
			}
			else if (j == 44) {
			    g2d.setColor(GRAY_V01);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 45) {
			    g2d.setColor(GRAY_V16);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 46) {
			    g2d.setColor(GRAY_V00);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}
			else if (j == 47) {
			    g2d.setColor(WHITE);
			    //g2d.drawPolyline(signalTI,signalArrayI[j],1920);
			    g2d.drawPolygon(rectX[j],rectY[j],rectPtsN);

			}


			
			double minJump = 1.0;
			double maxJump = 2.0;
			double dJX = Math.random();
			double dJY = Math.random();

			dJX = pDir(dJX);
			dJY = pDir(dJY);
			
			double rf = Math.random()/Math.nextDown(1.0);
			double rx = minJump*(1.0 - rf) + maxJump*rf;

			double sf = Math.random()/Math.nextDown(1.0);
			double sx = minJump*(1.0 - sf) + maxJump*sf;


			double minRot = Math.PI/12.0;
			double maxRot = Math.PI/6.0;
			double dRot = Math.random();
			dRot = pDir(dRot); 
			double rotf = Math.random()/Math.nextDown(1.0);
			double rotAngle = dRot*(minRot*(1.0 - sf) + maxRot*sf);
			
			for (int jd = 0; jd < rectPtsN; jd++) {


			    if (rTimeX/10.0 < i && rTimeX > i) {
			    
				if (j % 8 == 4) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);

				}
				else if (j % 8  == 1) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);

				}
				else if (j % 8  == 7) {
				    rectX[j][jd] = rectX[j][jd]; 
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 3) {
				    rectX[j][jd] = rectX[j][jd];
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				
				}
				else if (j % 8 == 0) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 6) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 5) {
				    rectX[j][jd] = rectX[j][jd] + (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 2) {
				    rectX[j][jd] = rectX[j][jd] - (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				
				}
			    }
			    else if (2*rTimeX < i && i > rTimeX) {
				
				if (j % 8 == 7) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);
				    
				}
				else if (j % 8  == 4) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);

				}
				else if (j % 8  == 5) {
				    rectX[j][jd] = rectX[j][jd]; 
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 6) {
				    rectX[j][jd] = rectX[j][jd];
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				
				}
				else if (j % 8 == 3) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 0) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 1) {
				    rectX[j][jd] = rectX[j][jd] + (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 2) {
				    rectX[j][jd] = rectX[j][jd] - (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				    
				}

			    }
			    else {
				
				if (j % 8 == 0) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);
				    
				}
				else if (j % 8  == 1) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd];// + (int)(sx*dJY);

				}
				else if (j % 8  == 2) {
				    rectX[j][jd] = rectX[j][jd]; 
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 3) {
				    rectX[j][jd] = rectX[j][jd];
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				
				}
				else if (j % 8 == 4) {
				    rectX[j][jd] = (rectX[j][jd] + (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 5) {
				    rectX[j][jd] = (rectX[j][jd] - (int)1.0);
				    rectY[j][jd] = rectY[j][jd] + (int)1.0;

				}
				else if (j % 8  == 6) {
				    rectX[j][jd] = rectX[j][jd] + (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;// + (int)(sx*dJY);

				}
				else if (j % 8 == 7) {
				    rectX[j][jd] = rectX[j][jd] - (int)1.0;
				    rectY[j][jd] = rectY[j][jd] - (int)1.0;
				    
				}


				
			    }

			}

			double p1x = rectX[j][0];
			double p2x = rectX[j][1];
			double p3x = rectX[j][2];
			double p4x = rectX[j][3];
			
			double p1y = rectY[j][0];
			double p2y = rectY[j][1];
			double p3y = rectY[j][2];
			double p4y = rectY[j][3];
 
			double m13 = (p1y - p3y)/(p1x - p3x);
			double m24 = (p2y - p4y)/(p2x - p4x);

			double dp1p3 = Distance(p1x,p1y,p3x,p3y);
			double dp2p4 = Distance(p2x,p2y,p4x,p4y); //should have dp1p3 == dp2p4

			double cX = p1x + 0.5 * dp1p3;			
			if (p1x > p3x) 
			    cX = p1x - 0.5 * dp1p3;

			
			double cY = p1y + 0.5 * dp1p3;
			if (p1y > p3y)
			    cY = p1y - 0.5 * dp1p3;


			
						  
			for (int z1 = 0; z1 < rectPtsN; z1++) {

			    // double x = (double)rectX[j][z1];
			    // double y = (double)rectY[j][z1];

			    // // double xT = x - Math.abs(cX - widthHalf);
			    // // double yT = y - Math.abs(cY - heightHalf);
			    // double xT = x - Math.abs(cX-(double)widthHalf);
			    // double yT = y - Math.abs(cY-(double)heightHalf);

			    
			    // // double xTT = (xT * Math.cos(rotAngle) - yT * Math.sin(rotAngle));
			    // // double yTT = (xT * Math.sin(rotAngle) + yT * Math.cos(rotAngle));

			    // xTT = xTT + Math.abs(cX - widthHalf);
			    // yTT = yTT + Math.abs(cY - heightHalf);
			    
			    // rectX[j][z1] = (int)xTT;
			    //rectY[j][z1] = (int)yTT;
			}

		    }
	
		// Disposes of this graphics context and releases any system resources that it is using. 
		g2d.dispose();
 
		// Save as PNG
		File file = new File(fileName);
		ImageIO.write(bufferedImage, "png", file);
 
		// Save as JPEG
		//file = new File("myimage.jpg");
		//ImageIO.write(bufferedImage, "jpg", file);

	    }

	
	System.out.println("Done.");
 
    }
 
}
