pageextension 50101 "Autotask Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Autotask ID"; Rec."Autotask ID")
            {
                ApplicationArea = Basic, All;
            }
        }
    }
}