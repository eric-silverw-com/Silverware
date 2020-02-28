pageextension 50112 "SWC Purchase Order List" extends "Purchase Order List"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Posting Description "; "Posting Description")
            {
                ApplicationArea = All;
            }
        }
    }

}