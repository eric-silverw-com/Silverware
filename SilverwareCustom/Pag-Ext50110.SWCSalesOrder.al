pageextension 50110 "SWC Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("SWC Due Upon Receipt"; "SWC Due Upon Receipt")
            {
                ApplicationArea = All;
            }
        }
    }
}