pageextension 50100 "Autotask Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Autotask ID"; Rec."Autotask ID")
            {
                ApplicationArea = Basic, All;
            }
        }
    }
}