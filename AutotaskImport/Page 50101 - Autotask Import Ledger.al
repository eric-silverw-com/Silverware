page 50101 "Autotask Import Ledger"
{
    PageType = List;
    ApplicationArea = Basic, All;
    UsageCategory = History;
    SourceTable = "Autotask Import Ledger";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
                field("Invoice ID"; "Invoice ID") { ApplicationArea = Basic, All; }
                field("Client ID"; "Client ID") { ApplicationArea = Basic, All; }
                field("Client Name"; "Client Name") { ApplicationArea = Basic, All; }
                field("Client No."; "Client No.") { ApplicationArea = Basic, All; }
                field("Document Date"; "Document Date") { ApplicationArea = Basic, All; }
                field("Invoice No."; "Invoice No.") { ApplicationArea = Basic, All; }
                field("Ticket No."; "Ticket No.") { ApplicationArea = Basic, All; }
                field("Job No."; "Job No.") { ApplicationArea = Basic, All; }
                field("Ticket Title"; "Ticket Title") { ApplicationArea = Basic, All; }
                field("Ticket Contact"; "Ticket Contact") { ApplicationArea = Basic, All; }
                field(Description; Description) { ApplicationArea = Basic, All; }
                field("Resource Name"; "Resource Name") { ApplicationArea = Basic, All; }
                field("Resource Type"; "Resource Type") { ApplicationArea = Basic, All; }
                field("Line Type"; "Line Type") { ApplicationArea = Basic, All; }
                field("Line No."; "Line No.") { ApplicationArea = Basic, All; }
                field("Ticket Summary"; "Ticket Summary") { ApplicationArea = Basic, All; }
                field(Quantity; Quantity) { ApplicationArea = Basic, All; }
                field(Rate; Rate) { ApplicationArea = Basic, All; }
                field(Amount; Amount) { ApplicationArea = Basic, All; }
                field("Import Date"; "Import Date") { ApplicationArea = Basic, All; }
                field("Posting Date"; "Posting Date") { ApplicationArea = Basic, All; }
                field("Entry No."; "Entry No.") { ApplicationArea = Basic, All; }
            }
        }
    }
}