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
                field("Invoice ID"; Rec."Invoice ID") { ApplicationArea = Basic, All; }
                field("Client ID"; Rec."Client ID") { ApplicationArea = Basic, All; }
                field("Client Name"; Rec."Client Name") { ApplicationArea = Basic, All; }
                field("Client No."; Rec."Client No.") { ApplicationArea = Basic, All; }
                field("Document Date"; Rec."Document Date") { ApplicationArea = Basic, All; }
                field("Invoice No."; Rec."Invoice No.") { ApplicationArea = Basic, All; }
                field("Ticket No."; Rec."Ticket No.") { ApplicationArea = Basic, All; }
                field("Job No."; Rec."Job No.") { ApplicationArea = Basic, All; }
                field("Ticket Title"; Rec."Ticket Title") { ApplicationArea = Basic, All; }
                field("Ticket Contact"; Rec."Ticket Contact") { ApplicationArea = Basic, All; }
                field(Description; Rec.Description) { ApplicationArea = Basic, All; }
                field("Resource Name"; Rec."Resource Name") { ApplicationArea = Basic, All; }
                field("Resource Type"; Rec."Resource Type") { ApplicationArea = Basic, All; }
                field("Line Type"; Rec."Line Type") { ApplicationArea = Basic, All; }
                field("Line No."; Rec."Line No.") { ApplicationArea = Basic, All; }
                field("Ticket Summary"; Rec."Ticket Summary") { ApplicationArea = Basic, All; }
                field(Quantity; Rec.Quantity) { ApplicationArea = Basic, All; }
                field(Rate; Rec.Rate) { ApplicationArea = Basic, All; }
                field(Amount; Rec.Amount) { ApplicationArea = Basic, All; }
                field("Import Date"; Rec."Import Date") { ApplicationArea = Basic, All; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = Basic, All; }
                field("Entry No."; Rec."Entry No.") { ApplicationArea = Basic, All; }
            }
        }
    }
}