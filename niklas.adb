with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Niklas is

   procedure Insert_At_Head(List: access List_T; Node: Emb_Node_Ref_T) is
      use Ada.Text_IO;
   begin

      Put_Line("Ins_Start");
      Node.Next := List.Next;

      Put_Line("Ins_A");
      Node.Prev := Emb_Node_Ref_T(List);  -- Exception raised here
      -- raised PROGRAM_ERROR : niklas.adb:14 accessibility check failed

      Put_Line("Ins_B");
      if Node.Next /= Null then
         Put_Line("Ins_C");
         Node.Next.Prev := Node;
      end if;

      Put_Line("Ins_D");
      List.Next := Node;

      Put_Line("Ins_E");
      List.Prev := Null;
      Put_Line("Ins_Done");

   end Insert_At_Head;

   procedure Delete(Node: in Emb_Node_Ref_T) is
   begin
      if Node.Prev /= Null then
         Node.Prev.Next := Node.Next;
         Node.Prev := Null;
      end if;
      if Node.Next /= Null then
         Node.Next.Prev := Node.Prev;
         Node.Next := Null;
      end if;

   end Delete;

   procedure Print_Integer_Values (List : in List_T'Class) is 
      Node : Emb_Node_Ref_T := List.Next; 
   begin 
      while Node /= Null loop 
         if Node.all in Integer_Emb_Node_T'Class then 
            Ada.Integer_Text_IO.Put (Integer_Emb_Node_T(Node.all).Obj.Value); 
         end if; 
         Node := Node.Next; 
      end loop; 
   end Print_Integer_Values;

end Niklas;
