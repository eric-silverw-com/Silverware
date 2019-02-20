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
    begin
        Customer.Open(Database::"Customer");
        AllField.SetRange(TableNo, Customer.Number());
        AllField.SetRange("No.", 50003);
        if not AllField.IsEmpty() then begin
            Customer.Find('-');
            repeat
                Customer.Field(50106).Value := Customer.Field(50003).Value;
                Customer.Modify();
            until Customer.Next() = 0;
        end;
    end;
}