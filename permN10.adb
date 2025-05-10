--
-- Title     : Finds all permutations of n = 10 integers:
--           :        { 1 2 3 4 5 6 7 8 9 10 }
--           : Outputs the n! = 3628800 permutations on
--           : standard output one permutation per line.
--           : 
--
-- Reference : Ada Reference Manual ISO/IEC 8652:1995(E)
--           : 
--
-- Author    : Keith Rehm
-- Date      : 05/10/2025
-- Editor    : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
--           : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
-- Compiler  : GNATMAKE Community 2020 (20200818-84)
--           : Copyright (C) 1995-2020, Free Software Foundation, Inc.
--           : This is free software; see the source for copying conditions.
--           : There is NO warranty; not even for MERCHANTABILITY
--           : or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Text_Io; use Ada.Text_Io;

procedure permN10 is

   Type Integer_Vector is Array (Integer Range <>) of Integer;
   Subtype I10 is Integer_Vector (1..10);
   intVector10 : I10 := (others => 0);

   function unique10 ( v : I10 ) return boolean is
   begin
     for i in I10'range loop
        for j in I10'range loop
           if v(i) = v(j) and not (i = j) then
  	    return false;
  	   end if;
        end loop;
     end loop;
     return true;
   end unique10;

begin

   for i in 1..10 loop
      intVector10(1) := i;
      for j in 1..10 loop
	 intVector10(2) := j;
         for k in 1..10 loop
            intVector10(3) := k;
	    for l in 1..10 loop
	       intVector10(4) := l;
	       for m in 1..10 loop
	          intVector10(5) := m;
	          for n in 1..10 loop
	             intVector10(6) := n;
	             for o in 1..10 loop
	                intVector10(7) := o;
	                for p in 1..10 loop
	                   intVector10(8) := p;
	                   for q in 1..10 loop
	                      intVector10(9) := q;
	                      for s in 1..10 loop
	                         intVector10(10) := s;
                                 if unique10(intVector10) then
                                    put_line ( i'img &
                                               j'img &
                                               k'img &
                                               l'img &
                                               m'img &
                                               n'img &
                                               o'img &
                                               p'img &
                                               q'img &
                                               s'img    );
                                 end if;
                              end loop;
                           end loop;
                        end loop;
                     end loop;
                   end loop;
                end loop;
              end loop;
           end loop;
	end loop;
    end loop;

exception when others =>
   put_line("CRASH: permN10.adb");
end permN10;