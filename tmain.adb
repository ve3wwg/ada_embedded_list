with Niklas;
with Ada.Text_IO;

procedure TMain is
   use Niklas;
   use Ada.Text_IO;

   List1:   aliased List_T;
   One:     access Integer_Object_T := new Integer_Object_T;
   Two:     access Integer_Object_T := new Integer_Object_T;
   Three:   access Integer_Object_T := new Integer_Object_T;
begin

   One.Value := 1;
   Two.Value := 2;
   Three.Value := 3;
   
   Put_Line("Ins1..");
   Insert_At_Head(List1'Access,Two.Node1'Access);
   Put_Line("Ins2..");
   Insert_At_Head(List1'Access,One.Node1'Access);
   Put_Line("Ins3..");
   Insert_At_Head(List1'Access,Three.Node1'Access);

   Put_Line("Traversal..");
   Print_Integer_Values(List1);

end TMain;
