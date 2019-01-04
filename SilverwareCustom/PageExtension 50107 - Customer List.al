pageextension 50107 "Silverware Customer List" extends "Customer List"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Account Manager"; "Account Manager")
            {
                ApplicationArea = Basic, All;
            }
        }
    }
}