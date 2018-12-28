table 50101 "Autotask Import Ledger"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; }
        field(5; "Invoice ID"; Integer) { Caption = 'Invoice ID'; }
        field(6; "Client ID"; Integer) { Caption = 'Client ID'; }
        field(7; "Client Name"; Text[50]) { Caption = 'Client Name'; }
        field(8; "Client No."; Code[20]) { Caption = 'Client No.'; Description = 'Navision Client No.'; }
        field(10; "Document Date"; Date) { Caption = 'Document Date'; }
        field(12; "Invoice No."; Code[20]) { Caption = 'Invoice No.'; }
        field(15; "Ticket No."; Text[30]) { Caption = 'Ticket No.'; }
        field(17; "Job No."; Code[20]) { Caption = 'Job No.'; }
        field(20; "Ticket Title"; Text[250]) { Caption = 'Ticket Title'; }
        field(21; "Ticket Contact"; Text[50]) { Caption = 'Ticket Contact'; }
        field(25; "Description"; Text[50]) { Caption = 'Description'; Description = 'Navision Description'; }
        field(30; "Resource Name"; Text[50]) { Caption = 'Resource Name'; }
        field(31; "Resource Type"; Text[20]) { Caption = 'Resource Type'; }
        field(35; "Line Type"; Option) { Caption = 'Line Type'; OptionMembers = " ","G/L Account","Item","Resource","Fixed Asset","Charge (Item)"; Description = 'Navision Type'; }
        field(36; "Line No."; Code[20]) { Caption = 'Line No.'; Description = 'Navision No'; }
        field(40; "Ticket Summary"; Text[250]) { Caption = 'Ticket Summary'; }
        field(50; "Quantity"; Decimal) { Caption = 'Quantity'; }
        field(51; "Rate"; Decimal) { Caption = 'Rate'; }
        field(52; "Amount"; Decimal) { Caption = 'Amount'; }
        field(80; "Import Date"; DateTime) { Caption = 'Import Date'; }
        field(81; "Posting Date"; Date) { Caption = 'Posting Date'; }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}