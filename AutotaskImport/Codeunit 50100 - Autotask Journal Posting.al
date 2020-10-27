codeunit 50100 "Autotask Journal Posting"
{
    trigger OnRun()
    begin
        if not Confirm('Post Autotask Journal') then
            exit;

        // Check for obvious errors
        AutotaskJournal.FindSet();
        repeat
            AutotaskJournal.TestField("Client No.");
            if AutotaskJournal."Line Type" <> AutotaskJournal."Line Type"::" " then
                AutotaskJournal.TestField("Line No.");
        until AutotaskJournal.Next() = 0;

        // Import invoices
        if AutotaskLedger.FindLast() then;
        AutotaskJournal.SetCurrentKey("Client No.", "Invoice ID");
        AutotaskJournal.FindSet();
        repeat
            // Create the sales header when the document number changes
            if SalesHeader."External Document No." <> FORMAT(AutotaskJournal."Invoice No.") then begin
                InvoiceCount += 1;
                Clear(SalesHeader);
                SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                SalesHeader.Insert(true);

                SalesHeader.Validate("Sell-to Customer No.", AutotaskJournal."Client No.");
                SalesHeader."External Document No." := Format(AutotaskJournal."Invoice No.");
                if AutotaskJournal."Ticket Contact" <> '' then
                    SalesHeader."Sell-to Contact" := AutotaskJournal."Ticket Contact";
                SalesHeader.Validate("Posting Date", AutotaskJournal."Posting Date");
                SalesHeader."Posting Description" := StrSubstNo('Billing No. %1', SalesHeader."External Document No.");
                SalesHeader.Modify();

                Clear(SalesLine);
                SalesLine."Document Type" := SalesHeader."Document Type";
                Salesline."Document No." := SalesHeader."No.";
            end;

            SalesLine.Init();
            SalesLine."Line No." += 10000;
            SalesLine.Validate("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            Evaluate(SalesLine.Type, Format(AutotaskJournal."Line Type"));
            SalesLine.Validate("No.", AutotaskJournal."Line No.");
            SalesLine.Description := AutotaskJournal.Description;
            if AutotaskJournal."Line Type" = AutotaskJournal."Line Type"::Item then
                SalesLine.Validate("Job No.", AutotaskJournal."Job No.");
            SalesLine.Validate(Quantity, AutotaskJournal.Quantity);
            SalesLine.Validate("Unit Price", AutotaskJournal.Rate);
            SalesLine.Insert();

            // Insert the line into the Autotask Ledger
            AutotaskJournal."Invoice No." := SalesHeader."No.";
            AutotaskLedger."Entry No." += 1;
            AutotaskLedger.TransferFields(AutotaskJournal, false);
            AutotaskLedger.Insert();
        until AutotaskJournal.Next() = 0;

        AutotaskJournal.DeleteAll();

        Message('%1 Invoices Created', InvoiceCount);
    end;

    var
        AutotaskJournal: Record "Autotask Import Journal";
        AutotaskLedger: Record "Autotask Import Ledger";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        InvoiceCount: Integer;
}