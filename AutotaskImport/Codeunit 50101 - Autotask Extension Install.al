codeunit 50101 "Autotask Install"
{
    // Change this to upgrade at some point
    Subtype = Install;

    trigger OnRun()
    begin

    end;

    trigger OnInstallAppPerCompany()
    var
        xAutoTaskImportLedger: RecordRef;
        AutoTaskImportLedger: RecordRef;
        Customer: RecordRef;
        AllObject: Record AllObj;
        AllFieldSrc: Record Field;
        AllFieldDst: Record Field;
    begin
        AutotaskImportLedger.Open(Database::"Autotask Import Ledger");
        AllObject.SetRange("Object Type", AllObject."Object Type"::Table);
        AllObject.SetRange("Object ID", 50001);
        if not AllObject.IsEmpty() and AutoTaskImportLedger.IsEmpty() then begin
            AllFieldDst.SetRange(TableNo, Database::"Autotask Import Ledger");
            AllFieldSrc.SetRange(TableNo, 50001);
            xAutoTaskImportLedger.Open(50001);
            xAutoTaskImportLedger.FindSet();
            repeat
                AllFieldSrc.FindSet();
                AutoTaskImportLedger.Init();
                repeat
                    AllFieldDst.SetRange(FieldName, AllFieldSrc.FieldName);
                    AllFieldDst.FindFirst();
                    AutoTaskImportLedger.Field(AllFieldDst."No.").Value := xAutoTaskImportLedger.Field(AllFieldSrc."No.").Value;
                until AllFieldSrc.Next() = 0;
                AutoTaskImportLedger.Insert()
            until xAutoTaskImportLedger.Next() = 0;
        end;

        Customer.Open(Database::Customer);
        Customer.FindSet();
        repeat
            Customer.Field(50100).Value := Customer.Field(50001).Value;
            Customer.Modify();
        until Customer.Next() = 0;

    end;
}