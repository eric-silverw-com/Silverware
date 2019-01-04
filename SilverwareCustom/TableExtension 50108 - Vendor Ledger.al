tableextension 50108 "Silverware Vendor Ledger" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50106; "Vendor Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup (Vendor.Name WHERE ("No." = FIELD ("Vendor No.")));
            Description = 'SIL007';
        }
    }
}