tableextension 50107 "Silverware Cust. Ledger" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50106; "Customer Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup (Customer.Name WHERE ("No." = FIELD ("Customer No.")));
            Description = 'SIL007-01';
        }
    }
}