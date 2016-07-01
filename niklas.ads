package Niklas is

   type Emb_Node_T is tagged;
   type Emb_Node_Ref_T is access all Emb_Node_T'Class;
   
   type Emb_Node_T is tagged
      record
         Prev:    Emb_Node_Ref_T;
         Next:    Emb_Node_Ref_T;
      end record;
   
   subtype List_T is Emb_Node_T;

   procedure Insert_At_Head(List: access List_T; Node: Emb_Node_Ref_T);
   procedure Delete(Node: Emb_Node_Ref_T);

   type Integer_Object_T; 

   type Integer_Emb_Node_T (Obj : access Integer_Object_T) is new Emb_Node_T 
      with null record; 

   type Integer_Object_T is limited
      record 
         Value:   Integer; 
         Node1:   aliased Integer_Emb_Node_T(Integer_Object_T'Access); 
         Node2:   aliased Integer_Emb_Node_T(Integer_Object_T'Access); 
      end record; 

   procedure Print_Integer_Values (List : in List_T'Class);

private

end Niklas;
