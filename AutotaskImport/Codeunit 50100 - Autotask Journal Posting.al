codeunit 50100 "Autotask Journal Posting"
{
    trigger OnRun()
    begin
        if not Confirm('Post Autotask Journal') then
            exit;

        with AutotaskJournal do begin
            // Check for obvious errors
            FindSet();
            repeat
                TestField("Client No.");
                if "Line Type" <> "Line Type"::" " then
                    TestField("Line No.");
            until Next() = 0;

            // Import invoices
            if AutotaskLedger.FindLast() then;
            SetCurrentKey("Client No.", "Invoice ID");
            FindSet();
            repeat
                // Create the sales header when the document number changes
                if SalesHeader."External Document No." <> FORMAT("Invoice No.") then begin
                    InvoiceCount += 1;
                    Clear(SalesHeader);
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.Insert(true);

                    SalesHeader.Validate("Sell-to Customer No.", "Client No.");
                    SalesHeader."External Document No." := Format("Invoice No.");
                    if "Ticket Contact" <> '' then
                        SalesHeader."Sell-to Contact" := "Ticket Contact";
                    SalesHeader.Validate("Posting Date", "Posting Date");
                    SalesHeader."Posting Description" := StrSubstNo('Billing No. %1', SalesHeader."External Document No.");
                    SalesHeader.Modify();

                    Clear(SalesLine);
                    SalesLine."Document Type" := SalesHeader."Document Type";
                    Salesline."Document No." := SalesHeader."No.";
                end;

                SalesLine.Init();
                SalesLine."Line No." += 10000;
                SalesLine.Validate("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.Type := "Line Type";
                SalesLine.Validate("No.", "Line No.");
                SalesLine.Description := Description;
                if "Line Type" = "Line Type"::Item then
                    SalesLine.Validate("Job No.", "Job No.");
                SalesLine.Validate(Quantity, Quantity);
                SalesLine.Validate("Unit Price", Rate);
                SalesLine.Insert();

                // Insert the line into the Autotask Ledger
                "Invoice No." := SalesHeader."No.";
                AutotaskLedger."Entry No." += 1;
                AutotaskLedger.TransferFields(AutotaskJournal);
                AutotaskLedger.Insert();
            until Next() = 0;

            DeleteAll();
        end;

        Message('%1 Invoices Created', InvoiceCount);
    end;

    var
        AutotaskJournal: Record "Autotask Import Journal";
        AutotaskLedger: Record "Autotask Import Ledger";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        InvoiceCount: Integer;
}