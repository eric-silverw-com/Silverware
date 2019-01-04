codeunit 50106 "Silverware Custom Install"
{
    // Change this to upgrade at some point
    Subtype = Install;

    trigger OnRun()
    begin

    end;

    trigger OnInstallAppPerCompany()
    var
        Customer: RecordRef;
        AllField: Record Field;
        SourceField: FieldRef;
        DestField: FieldRef;
    begin
        Customer.Open(Database::"Customer");
        AllField.SetRange(TableNo, Customer.Number());
        AllField.SetRange("No.", 50003);
        if not AllField.IsEmpty() then begin
            Customer.Find('-');
            repeat
                SourceField := Customer.Field(50003);
                DestField := Customer.Field(50106);
                DestField.Value := SourceField.Value();
                Customer.Modify();
            until Customer.Next() = 0;
        end;
    end;
}