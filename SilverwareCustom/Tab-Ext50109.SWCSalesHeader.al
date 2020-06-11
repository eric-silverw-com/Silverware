tableextension 50109 "SWC Sales Header" extends "Sales Header"
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