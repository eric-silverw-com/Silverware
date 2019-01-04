pageextension 50106 "Silverware Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Account Manager"; "Account Manager")
            {
                ApplicationArea = Basic, All;
            }
        }
    }
}