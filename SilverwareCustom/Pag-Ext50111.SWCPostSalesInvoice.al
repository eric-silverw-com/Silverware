pageextension 50111 "SWC Posted Sales Invoice" extends "Posted Sales Invoice"
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