page 50100 "Autotask Import"
{
    PageType = Worksheet;
    ApplicationArea = Basic, All;
    UsageCategory = Tasks;
    SourceTable = "Autotask Import Journal";
    DataCaptionExpression = '';

    layout
    {
        area(Content)
        {
            group("Time")
            {
                field("Resource Type"; "Resource Type") { ApplicationArea = Basic, All; }
                field("Resource Name"; "Resource Name") { ApplicationArea = Basic, All; }
                field("Ticket Summary"; "Ticket Summary") { ApplicationArea = Basic, All; }
            }
            group("Ticket")
            {
                field("Ticket Contact"; "Ticket Contact") { ApplicationArea = Basic, All; }
                field("Ticket Title"; "Ticket Title") { ApplicationArea = Basic, All; }
            }
            repeater("Entries")
            {
                field("Invoice No."; "Invoice No.") { ApplicationArea = Basic, All; }
                field("Invoice ID"; "Invoice ID") { ApplicationArea = Basic, All; }
                field("Client ID"; "Client ID") { ApplicationArea = Basic, All; }
                field("Client No."; "Client No.") { ApplicationArea = Basic, All; }
                field("Client Name"; "Client Name") { ApplicationArea = Basic, All; }
                field("Posting Date"; "Posting Date") { ApplicationArea = Basic, All; }
                field("Document Date"; "Document Date") { ApplicationArea = Basic, All; }
                field("Job No."; "Job No.") { ApplicationArea = Basic, All; }
                field(Description; Description) { ApplicationArea = Basic, All; }
                field("Line Type"; "Line Type") { ApplicationArea = Basic, All; }
                field("Ticket No."; "Ticket No.") { ApplicationArea = Basic, All; }
                field("Line No."; "Line No.") { ApplicationArea = Basic, All; }
                field(Quantity; Quantity) { ApplicationArea = Basic, All; }
                field(Rate; Rate) { ApplicationArea = Basic, All; }
                field(Amount; Amount) { ApplicationArea = Basic, All; }
                field("Entry No."; "Entry No.") { ApplicationArea = Basic, All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = Basic, All;
                RunObject = xmlport "Autotask Import";
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Image = Import;
            }
            action("Create Sales Invoices")
            {
                ApplicationArea = Basic, All;
                RunObject = codeunit "Autotask Journal Posting";
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Image = Post;
            }
        }
        area(Reporting)
        {
            action("Test Report")
            {
                ApplicationArea = Basic, All;
                RunObject = report "Autotask Test Report";
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                Image = TestReport;
            }

        }
    }

    var
        myInt: Integer;
}