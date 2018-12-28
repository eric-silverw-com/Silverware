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
        AllObject: Record AllObj;
        AllField: Record Field;
    begin
        AutotaskImportLedger.Open(Database::"Autotask Import Ledger");
        AllObject.SetRange("Object Type", AllObject."Object Type"::Table);
        AllObject.SetRange("Object ID", 50001);
        if not AllObject.IsEmpty() and AutoTaskImportLedger.IsEmpty() then begin
            AllField.SetRange(TableNo, Database::"Autotask Import Ledger");
            xAutoTaskImportLedger.Open(50001);
            xAutoTaskImportLedger.FindSet();
            repeat
                AllField.FindSet();
                repeat
                    AutoTaskImportLedger.Init();
                    AutoTaskImportLedger.Field(AllField."No.").Value := xAutoTaskImportLedger.Field(AllField."No.").Value;
                until AllField.Next() = 0;
                AutoTaskImportLedger.Insert()
            until xAutoTaskImportLedger.Next() = 0;
        end;
    end;
}