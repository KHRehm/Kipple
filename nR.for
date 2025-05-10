C
C   Demonstration of Newton-Raphson method for finding roots
C   taken as is from Numerical Recipies CDROM (ISBN 0-521-57608-3)
C   examples.
C
C   Author   : Keith Rehm
C   Editor   : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
C            : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
C   Compiler : GNU Fortran (MacPorts gcc14 14.2.0_3+stdlib_flag) 14.2.0
C            : Copyright (C) 2024 Free Software Foundation, Inc.
C            : This is free software; see the source for copying conditions.  There is NO
C            : warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


      PROGRAM xrtnewt
C     driver for routine rtnewt
      INTEGER N,NBMAX
      REAL X1,X2
      PARAMETER(N=100,NBMAX=20,X1=1.0,X2=50.0)
      INTEGER i,nb
      REAL bessj0,rtnewt,root,xacc,xb1(NBMAX),xb2(NBMAX)
      EXTERNAL funcd,bessj0
      nb=NBMAX
      call zbrak(bessj0,X1,X2,N,xb1,xb2,nb)
      write(*,'(/1x,a)') 'Roots of BESSJ0:'
      write(*,'(/1x,t19,a,t31,a/)') 'x','F(x)'
      do 11 i=1,nb
        xacc=(1.0e-6)*(xb1(i)+xb2(i))/2.0
        root=rtnewt(funcd,xb1(i),xb2(i),xacc)
        write(*,'(1x,a,i2,2x,f12.6,e16.4)') 'Root ',i,root,bessj0(root)
11    continue
      END

      SUBROUTINE funcd(x,fn,df)
      REAL bessj0,bessj1,df,fn,x
      fn=bessj0(x)
      df=-bessj1(x)
      return
      END

      FUNCTION rtnewt(funcd,x1,x2,xacc)
      INTEGER JMAX
      REAL rtnewt,x1,x2,xacc
      EXTERNAL funcd
      PARAMETER (JMAX=20)
      INTEGER j
      REAL df,dx,f
      rtnewt=.5*(x1+x2)
      do 11 j=1,JMAX
        call funcd(rtnewt,f,df)
        dx=f/df
        rtnewt=rtnewt-dx
        if ((x1-rtnewt)*(rtnewt-x2).lt.0.) then
           print *,  'rtnewt jumped out of brackets'
C        if((x1-rtnewt)*(rtnewt-x2).lt.0.)pause        
C     *'rtnewt jumped out of brackets'
        end if
        if(abs(dx).lt.xacc) return
11    continue
      print *,  'rtnewt exceeded maximum iterations'
C      pause 'rtnewt exceeded maximum iterations'
      END

      SUBROUTINE zbrak(fx,x1,x2,n,xb1,xb2,nb)
      INTEGER n,nb
      REAL x1,x2,xb1(nb),xb2(nb),fx
      EXTERNAL fx
      INTEGER i,nbb
      REAL dx,fc,fp,x
      nbb=0
      x=x1
      dx=(x2-x1)/n
      fp=fx(x)
      do 11 i=1,n
        x=x+dx
        fc=fx(x)
        if(fc*fp.le.0.) then
          nbb=nbb+1
          xb1(nbb)=x-dx
          xb2(nbb)=x
          if(nbb.eq.nb)goto 1
        endif
        fp=fc
11    continue
1     continue
      nb=nbb
      return
      END

      
      FUNCTION bessj0(x)
      REAL bessj0,x
      REAL ax,xx,z
      DOUBLE PRECISION p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,r1,r2,r3,r4,r5,r6,
     *s1,s2,s3,s4,s5,s6,y
      SAVE p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,r1,r2,r3,r4,r5,r6,s1,s2,s3,s4,
     *s5,s6
      DATA p1,p2,p3,p4,p5/1.d0,-.1098628627d-2,.2734510407d-4,
     *-.2073370639d-5,.2093887211d-6/, q1,q2,q3,q4,q5/-.1562499995d-1,
     *.1430488765d-3,-.6911147651d-5,.7621095161d-6,-.934945152d-7/
      DATA r1,r2,r3,r4,r5,r6/57568490574.d0,-13362590354.d0,
     *651619640.7d0,-11214424.18d0,77392.33017d0,-184.9052456d0/,s1,s2,
     *s3,s4,s5,s6/57568490411.d0,1029532985.d0,9494680.718d0,
     *59272.64853d0,267.8532712d0,1.d0/
      if(abs(x).lt.8.)then
        y=x**2
        bessj0=(r1+y*(r2+y*(r3+y*(r4+y*(r5+y*r6)))))/(s1+y*(s2+y*(s3+y*
     *(s4+y*(s5+y*s6)))))
      else
        ax=abs(x)
        z=8./ax
        y=z**2
        xx=ax-.785398164
        bessj0=sqrt(.636619772/ax)*(cos(xx)*(p1+y*(p2+y*(p3+y*(p4+y*
     *p5))))-z*sin(xx)*(q1+y*(q2+y*(q3+y*(q4+y*q5)))))
      endif
      return
      END      

      FUNCTION bessj1(x)
      REAL bessj1,x
      REAL ax,xx,z
      DOUBLE PRECISION p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,r1,r2,r3,r4,r5,r6,
     *s1,s2,s3,s4,s5,s6,y
      SAVE p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,r1,r2,r3,r4,r5,r6,s1,s2,s3,s4,
     *s5,s6
      DATA r1,r2,r3,r4,r5,r6/72362614232.d0,-7895059235.d0,
     *242396853.1d0,-2972611.439d0,15704.48260d0,-30.16036606d0/,s1,s2,
     *s3,s4,s5,s6/144725228442.d0,2300535178.d0,18583304.74d0,
     *99447.43394d0,376.9991397d0,1.d0/
      DATA p1,p2,p3,p4,p5/1.d0,.183105d-2,-.3516396496d-4,
     *.2457520174d-5,-.240337019d-6/, q1,q2,q3,q4,q5/.04687499995d0,
     *-.2002690873d-3,.8449199096d-5,-.88228987d-6,.105787412d-6/
      if(abs(x).lt.8.)then
        y=x**2
        bessj1=x*(r1+y*(r2+y*(r3+y*(r4+y*(r5+y*r6)))))/(s1+y*(s2+y*(s3+
     *y*(s4+y*(s5+y*s6)))))
      else
        ax=abs(x)
        z=8./ax
        y=z**2
        xx=ax-2.356194491
        bessj1=sqrt(.636619772/ax)*(cos(xx)*(p1+y*(p2+y*(p3+y*(p4+y*
     *p5))))-z*sin(xx)*(q1+y*(q2+y*(q3+y*(q4+y*q5)))))*sign(1.,x)
      endif
      return
      END
