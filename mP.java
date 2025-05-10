//
//
//  Finds closed paths on connected graphs by
//  setting up an node/edge array and testing
//  all permutations of node traversal against
//  the graph array.
//
//  Author   : Keith Rehm
//  Editor   : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
//           : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
// Compiler  : Java 18.0.1.1 2022-04-22
//           : Java(TM) SE Runtime Environment (build 18.0.1.1+2-6)
//           : Java HotSpot(TM) 64-Bit Server VM
//           : (build 18.0.1.1+2-6, mixed mode, sharing)
//
//

import java.io.IOException;
import java.util.Random;
import java.util.Random.*;
import java.lang.Math.*;
import java.lang.reflect.*;
import java.lang.reflect.Array;
 
public class mP {

    public static Random rnd = new Random(System.currentTimeMillis());

    public static int[][] RNDG002 =      
    {{  1,1,1,1,0,1,0,0,0,0,1,0,0,0,0,1 }
     ,{ 0,1,1,1,1,0,1,0,0,0,0,0,0,1,1,1 } 
     ,{ 1,0,0,1,1,1,1,1,0,1,1,1,0,0,1,1 }
     ,{ 1,0,1,1,0,1,1,1,1,0,1,0,0,1,1,0 }
     ,{ 0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0 }
     ,{ 0,1,0,0,0,1,0,1,1,0,1,0,1,0,1,0 }
     ,{ 0,1,1,1,1,1,0,0,1,1,0,0,1,0,1,0 }
     ,{ 1,0,0,0,0,0,1,1,1,1,0,1,1,1,1,1 }
     ,{ 1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0 }
     ,{ 0,1,0,0,1,0,0,0,1,0,1,1,0,0,0,0 }
     ,{ 1,0,0,1,0,0,1,0,0,0,0,1,0,1,1,0 }
     ,{ 1,1,0,0,0,0,1,1,1,0,1,1,1,1,1,1 }
     ,{ 1,1,0,0,0,1,0,0,1,0,1,0,1,1,0,1 }
     ,{ 1,1,1,0,1,0,0,0,1,1,0,0,1,1,1,0 }
     ,{ 0,0,0,1,1,1,0,1,0,1,0,1,1,0,1,0 }
     ,{ 1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1 } };

    
    public static int[][] RNDG001 =  
    {    { 0,0,1,0,0,0,0,1 }
	,{ 0,0,0,0,0,1,1,1 }
	,{ 0,1,1,1,0,0,1,1 }
	,{ 1,0,1,0,0,1,1,0 }
	,{ 1,0,1,0,1,0,1,0 }
	,{ 1,0,1,0,1,0,1,0 }
	,{ 1,1,0,0,1,0,1,0 }
	,{ 1,1,0,1,1,1,1,1 } };
    
    public static int[][] Cube =
    {  { 0,1,0,0,0,1,0,1 }
      ,{ 1,0,1,0,1,0,0,0 }
      ,{ 0,1,0,1,0,0,0,1 }   
      ,{ 0,0,1,0,1,0,1,0 }
      ,{ 0,1,0,1,0,1,0,0 }
      ,{ 1,0,0,0,1,0,1,0 }                            
      ,{ 0,0,0,1,0,1,0,1 }   
      ,{ 1,0,1,0,0,0,1,0 } };


    public static int[][] Tetrahedron =
    {     { 0,1,1,1 }
	 ,{ 1,0,1,1 }
	 ,{ 1,1,0,1 }
	 ,{ 1,1,1,0 }};

    public static int[][] Square =
    {     { 0,1,0,1 }
	 ,{ 1,0,1,0 }
	 ,{ 0,1,0,1 }
	 ,{ 1,0,1,0 }};
    
    public static int[][] Triangle =
    {     { 0,1,1 }
	 ,{ 1,0,1 }
	 ,{ 1,1,0 }};
    
    
    public static int[][] Diamond =
    {  {0,1,1,1,0}
      ,{1,0,1,1,1}
      ,{1,1,0,1,1}
      ,{1,1,1,0,1}
      ,{0,1,1,1,0} };      

    public static void printV (int[] V) {
	System.out.print("("+V[0]);
	for (int i = 1 ; i < Array.getLength(V); i++) System.out.print(","+V[i]);
	System.out.println(")");
    }

    public static void printVV (int[][] VV) {
	for (int j = 0 ; j < Array.getLength(VV) ; j++ )
	    printV(VV[j]);
    }

    public static int[] swap (int[] v, int i, int j) {
	int s = v[i];
	v[i] = v[j];
	v[j] = s;
	return v;
    }

    public static int fact(int n) {
	if (n==1 || n==0) return 1;
	else
	    return n * fact(n-1);
    }
    
    public static int[] RndPerm (int[] v, int i) {
	int s = Array.getLength(v);
	int s0 = rnd.nextInt(s);
	int[] p = new int[s];
	p = v;
	swap(p,i,s0);
	return p;
    }

    public static int[] RndPerm2 (int[] v) {
        int s0 = rnd.nextInt(Array.getLength(v)),
            s1 = rnd.nextInt(Array.getLength(v));
        for (;s0 == s1;) s1 = rnd.nextInt(Array.getLength(v));
        return swap(v,s0,s1);
    }

    public static boolean eqV(int[] x, int[] y) {
	for (int i = 0 ; i < Array.getLength(x) ; i++)
	    if (x[i] != y[i]) return false;

	return true;
    }
    
    public static boolean vPCP(int[][] VVP, int[] P) {

	for ( int i = 0 ; i < Array.getLength(VVP) ; i++ )
	    if (eqV(VVP[i],P)) return true;

	return false;
    }

    public static boolean uPA(int[][] V) {
	int VL = Array.getLength(V);
	int uC = 0;
	for (int i = 0; i < VL ; i++) {
	    uC = 0;
	    for (int j = 0; j < VL ; j++) {	    
		if (eqV(V[i],V[j])) uC++;
	    }
	    if (uC > 1) return false;
	}
	return true;
    }

    public static boolean mUnique (int[][] V, int[] m) {
	int uC = 0;
	for (int i  = 0 ; i < Array.getLength(V) ; i++) {
	    if (V[i] == m) uC++;
	    if (uC > 1) return false;
	}
	return true;
    }


    public static int[] xTOv (int[] x, int[] v) {
	assert(Array.getLength(x)==Array.getLength(v));
	for (int i = 0; i < Array.getLength(x) ; i++) v[i] = x[i];
	return v;
    }
	

    public static int[][] PermA3(int[] v) {
	
	int[][] VVP = new int[fact(Array.getLength(v))][Array.getLength(v)];
	for(int i=0;i<fact(Array.getLength(v));i++)
	    for(int j=0;j<Array.getLength(v);j++)
		VVP[i][j] = 0;
	
	for (int i = 0 ; i < Array.getLength(v) ; i++) VVP[0][i] = v[i];
	
	for (int j = 1 ; j < fact(Array.getLength(v)) ; j++)
	    {
		
		boolean pExists = false;
		int[] m = new int[Array.getLength(v)];
		m = RndPerm2(v);
		
		for (int q = 0 ; q < fact(Array.getLength(v)) ; q++)
		    if (eqV(VVP[q],m)) pExists = true;
		
		if (!pExists)
		    for (int k = 0 ; k < Array.getLength(v) ; k++)
			VVP[j][k] = m[k];
		else
		    j--;
		
	    }


	// int Pinit = 0;
	// int[][] result = new int[fact(Array.getLength(v))][Array.getLength(v)+1];
	
	// for ( int i = 0 ; i < fact(Array.getLength(v)) ; i++ )
	//     for ( int j = 0 ; j < Array.getLength(v) ; j++ )
	// 	result[i][j]=VVP[i][j];
	
	// for ( int i = 0 ; i < fact(Array.getLength(v)) ; i++ ) {
	// 	Pinit = VVP[i][0];
	// 	result[i][Array.getLength(v)] = Pinit;
	//     }
		  
	//	return result;
	return VVP;
    }

    public static void zeroInitVVP(int[][] xV2P, int[] VV) {	
	for(int i=0;i<fact(Array.getLength(VV));i++)
	    for(int j=0;j<Array.getLength(VV);j++)
		xV2P[i][j] = 0;
    }


    public static void pHPth (int[] p) {
	System.out.print("closed path ... ");	
	System.out.print("(" + p[0]);
	for (int i = 1; i < Array.getLength(p) ; i++) System.out.print( "," + p[i] );
	System.out.println( ")");
	return;
    }

    public static boolean pClosed (int[][] G, int[] p)
    {
	boolean result = true;
	int[] pInd = new int[Array.getLength(p)];

	for(int i = 0; i < Array.getLength(pInd) ; i++) pInd[i] = p[i] - 1;
	if (G[pInd[Array.getLength(pInd)-1]][pInd[0]] != 1) return false;
	for(int i = 1; i < Array.getLength(pInd) ; i++)
	    if (G[pInd[i-1]][pInd[i]] != 1) return false;
		

	return result;
    }


    
    public static void PseudoProtoRockEmSockEmPathWalkin (int[][] G) {

	int cp = 0;
	int vL = Array.getLength(G[0]);
	int fVL = fact(vL);
	int[] V = new int[vL];
	for (int k = 0 ; k < vL ; k++) V[k] = k + 1; 
	int[][] VPths = new int[fVL][vL];
	VPths = PermA3(V);
	int[] VPth = V;
	for (int i = 0; i < fVL ; i++)
	    {
		int[] cV     = VPths[i];
		boolean pExst = pClosed(G,cV);

		if (pExst)
		    {
			cp++;
			//printV(cV);
		    }
	    }
	double pC = (double)cp/fVL*100.0;
	System.out.println("n! = " + fVL + " with " + cp + " closed paths ( " + pC + "% )");			
	return;
    }
    
    
    public static void main(String[] args) throws IOException {

	// System.out.print("...TRIANGLE....... ");	    			
        // PseudoProtoRockEmSockEmPathWalkin(Triangle);
	// System.out.print("...SQUARE......... ");	    			
        // PseudoProtoRockEmSockEmPathWalkin(Square);
	// System.out.print("...TETRAHEDRON.... ");	    			
        // PseudoProtoRockEmSockEmPathWalkin(Tetrahedron);
	System.out.print("...DIAMOND........ ");	    			
        PseudoProtoRockEmSockEmPathWalkin(Diamond);
	//System.out.print("...CUBE........... ");	    				
        //PseudoProtoRockEmSockEmPathWalkin(Cube);
	//System.out.print("...RNDG001........ ");	    				
	//PseudoProtoRockEmSockEmPathWalkin(RNDG001);
	// System.out.print("...RNDG002........ ");	    				
	// PseudoProtoRockEmSockEmPathWalkin(RNDG002);
	
	
	System.out.println("FIN ");	    		
	return;
    }
}


