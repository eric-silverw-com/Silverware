pageextension 50108 "Silverware Cust. Ledger" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer No.")
        {
            field("Customer Name"; "Customer Name") { }
        }
    }
}