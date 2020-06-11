tableextension 50110 "SWC Sales Inv Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50106; "SWC Due Upon Receipt"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Due Upon Receipt';
        }
    }
}