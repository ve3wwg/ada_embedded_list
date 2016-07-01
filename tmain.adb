with Niklas;
with Ada.Text_IO;

procedure TMain is
   use Niklas;
   use Ada.Text_IO;

   -- List1:   aliased List_T;  -- raised PROGRAM_ERROR : niklas.adb:14 accessibility check failed
   List1:      aliased access List_T := new List_T;
   One:        access Integer_Object_T := new Integer_Object_T;
   Two:        access Integer_Object_T := new Integer_Object_T;
   Three:      access Integer_Object_T := new Integer_Object_T;
begin

   One.Value := 1;
   Two.Value := 2;
   Three.Value := 3;
   
   Put_Line("Ins1 (2)..");
   Insert_At_Head(List1,Two.Node1'Access);
   Put_Line("Ins2 (1)..");
   Insert_At_Head(List1,One.Node1'Access);
   Put_Line("Ins3 (3)..");
   Insert_At_Head(List1,Three.Node1'Access);

   Put_Line("Traversal..");
   Print_Integer_Values(List1.all);

   Put_Line("Delete 1..");
   Delete(One.Node1'Access);

   Put_Line("Traversal after delete of 1..");
   Print_Integer_Values(List1.all);

end TMain;
