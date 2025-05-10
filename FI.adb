--
-- Title: Demonstration of functional iteration
--      : (fixed-point iteration) of the
--      : polynomial x^3 + 4x^2 - 10 = 0
--      : letting x = g(x) = 0.5 * (10.0 - x^3)^0.5
--
-- Reference: Numerical Analysis
--          : Ninth Edition
--          : Richard L. Burden and Douglas J. Faires
--
-- Author   : Keith Rehm
-- Date     : 05/05/2025
-- Editor   : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
--          : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
-- Compiler : GNATMAKE Community 2020 (20200818-84)
--          : Copyright (C) 1995-2020, Free Software Foundation, Inc.
--          : This is free software; see the source for copying conditions.
--          : There is NO warranty; not even for MERCHANTABILITY
--          : or FITNESS FOR A PARTICULAR PURPOSE.


with ada.text_io; use ada.text_io;
with ada.numerics; use ada.numerics;
with ada.numerics.elementary_functions;
use  ada.numerics.elementary_functions;

procedure FI is

   max_iter  : integer := 1000;
   tolerance : float   := 0.0001;
   p_0       : float   := 1.5;
   p_i       : float   := 0.0;
   success   : boolean := false;
   
   function g (x : float) return float is
   begin
      return ( 0.5 * (10.0 - x**3)**0.5 );      
   end g;

begin
   new_line(5);

   for i in 1..max_iter loop
      p_i := g(p_0);
      if abs(p_i - p_0) < tolerance then
         put_line("SUCCESS: Fixed point found at"
	           & p_i'image
		   & " in"
		   & i'image
		   & " iterations with"
		   & tolerance'image
		   & " tolerance.");
	 success := true;
	 exit;
      end if;
      p_0 := p_i;
   end loop;

   if not success then
      put_line("FAIL: Could not find fixed point.");
   end if;
   
   new_line(5);
exception when others =>
	put_line("CRASH: FI.adb");
end FI;