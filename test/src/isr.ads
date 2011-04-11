pragma Restrictions (No_Elaboration_Code);
--  pragma Restrictions (No_Implicit_Loops);
--  pragma Suppress (Elaboration_Check);
--  pragma Restrictions (No_Implicit_Dynamic_Code);

with System;

package ISR is
   pragma Pure;
   --  pragma Preelaborate;

   procedure Reset_Handler;
   pragma Export (C, Reset_Handler, "Reset_Handler");

   procedure Dummy;
   pragma Convention (C, Dummy);

--     type Vectors is private;
--     pragma Preelaborable_Initialization (Vectors);
--  private
   type Cb is not null access procedure;
   pragma Convention (C, Cb);

   --  type Vectors is array (1 .. 4) of Cb;
   --  pragma Convention (C, Vectors);

   Addr : constant System.Address := System'To_Address (16#0000_0000#);

   --  Vector : constant Vectors :=
   Vector : constant array (1 .. 4) of Cb :=
     (Dummy'Access,
      Dummy'Access,
      Dummy'Access,
      Dummy'Access);
   --  pragma Import (Ada, Vector);
   pragma Convention (C, Vector);
   pragma Linker_Section (Vector, ".vectors");
   --  for Vector'Address use Addr;
end ISR;
