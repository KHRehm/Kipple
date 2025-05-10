--
-- Title     : The Quarter Turn Theorem Test/Demonstration
--           : using the strong typing capability of the
--           : Ada programming language.
--
-- Reference : The VNR Concise Encyclopedia of Mathematics (ISBN 0-442-22646-2)
--           : Ada Reference Manual ISO/IEC 8652:1995(E)
--
-- Author    : Keith Rehm
-- Date      : 05/08/2025
-- Editor    : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
--           : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
-- Compiler  : GNATMAKE Community 2020 (20200818-84)
--           : Copyright (C) 1995-2020, Free Software Foundation, Inc.
--           : This is free software; see the source for copying conditions.
--           : There is NO warranty; not even for MERCHANTABILITY
--           : or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Text_Io; use Ada.Text_Io;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Float_Random;
use  Ada.Numerics.Float_Random;
with Ada.Real_Time; use Ada.Real_Time;
procedure tqtt is

   type TQTT_Angle is new Float range 0.0 .. 2.0*PI;

   package tqtt_ele_fcns is new
      Ada.Numerics.Generic_Elementary_Functions (Float_Type => TQTT_Angle);
   use tqtt_ele_fcns;

   tolerance : TQTT_Angle := 1.0e-6;
   theta     : constant TQTT_Angle := PI/2.0;
   Xarg      : TQTT_Angle   := 0.0;
   maxArgN   : integer := 1000;   
   QTR_A     : array (1..4) of TQTT_Angle := (0.0,PI/2.0,PI,3.0*(PI/2.0));
   successT  : Boolean := false;
   G         : Generator;
   secN      : Seconds_Count := 0;
   TSpan     : Time_Span := Time_Span_Zero;
   
   type Boolean_Array is array (Positive range <>) of Boolean;
   successV : Boolean_Array(1..3) := (others => true);

   Function V_p (V : Boolean_array) return Boolean is
   begin
      for i in V'range loop
        if not V(i) then
	   return false;
	end if;
      end loop;	
      return true;
   end V_p;

begin

   split(T => Clock, SC => secN, TS => TSpan);
   reset(G,Integer(secN));

   for qtr in 1..4 loop
      for j in 1..maxArgN loop

	 Xarg := QTR_A(qtr) + theta * TQTT_Angle(random(G));

	 successV(1) := abs(sin(xarg + theta) - cos(xarg)) < tolerance;
	 successV(2) := abs(cos(xarg + theta) + sin(xarg)) < tolerance;
         successV(3) := successV(1) and successV(2);
	 successT   := V_p(V => successV);
	 
      end loop;
      
      if not successT then
         exit;
      end if;
      
   end loop;

   if successT then
      put_line("SUCCESS: tqtt ");
   else
      put_line("FAIL: tqtt ");
   end if;

exception when others =>
   put_line("CRASH: tqtt.adb");
end tqtt;