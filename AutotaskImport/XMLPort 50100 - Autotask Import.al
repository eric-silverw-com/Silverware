xmlport 50100 "Autotask Import"
{
    Format = VariableText;
    Direction = Import;

    schema
    {
        textelement(Root)
        {
            tableelement(AutotaskImportJournal; "Autotask Import Journal")
            {
                fieldelement(InvoiceID; AutotaskImportJournal."Invoice ID") { }
                fieldelement(InvoiceNo; AutotaskImportJournal."Invoice No.") { }
                fieldelement(ClientID; AutotaskImportJournal."Client ID") { }
                textelement(Filler01) { }
                textelement(Filler02) { }
                textelement(Filler03) { }
                textelement(Filler04) { }
                textelement(Filler05) { }
                fieldelement(DocumentDate; AutotaskImportJournal."Document Date") { }
                fieldelement(ClientName; AutotaskImportJournal."Client Name") { }
                fieldelement(TicketNo; AutotaskImportJournal."Ticket No.") { }
                fieldelement(TicketTitle; AutotaskImportJournal."Ticket Title") { }
                fieldelement(TicketContact; AutotaskImportJournal."Ticket Contact") { }
                textelement(Filler06) { }
                textelement(Filler07) { }
                textelement(Filler08) { }
                textelement(Filler09) { }
                fieldelement(ResourceName; AutotaskImportJournal."Resource Name") { }
                textelement(Filler10) { }
                fieldelement(ResourceType; AutotaskImportJournal."Resource Type") { }
                textelement(Filler11) { }
                textelement(Filler12) { }
                textelement(Filler13) { }
                textelement(Filler14) { }
                textelement(TicketSummary)
                {
                    trigger OnAfterAssignVariable()
                    begin
                        AutotaskImportJournal."Ticket Summary" := CopyStr(TicketSummary, 1, 250);
                    end;
                }
                fieldelement(Rate; AutotaskImportJournal.Rate) { }
                fieldelement(Quantity; AutotaskImportJournal.Quantity) { }
                fieldelement(Amount; AutotaskImportJournal.Amount) { }
                textelement(Filler15) { }
                textelement(Filler16) { }
                textelement(ItemQuantity) { }
                textelement(Filler17) { }
                textelement(Filler18) { }
                textelement(Filler19) { }
                textelement(Filler20) { }
                textelement(Filler21) { }
                textelement(Filler22) { }
                textelement(Filler23) { }
                textelement(Filler24) { }
                textelement(Filler25) { }
                textelement(Filler26) { }
                textelement(Filler27) { }
                textelement(Filler28) { }
                textelement(Filler29) { }
                textelement(Filler30) { }
                textelement(Filler31) { }
                textelement(Filler32) { }
                textelement(Filler33) { }
                textelement(Filler34) { }
                textelement(ItemName1) { }
                textelement(Filler35) { }
                textelement(Filler36) { }
                textelement(Filler37) { }
                textelement(Filler38) { }
                textelement(Filler39) { }
                textelement(Filler40) { }
                textelement(Filler41) { }
                textelement(Filler42) { }
                textelement(Filler43) { }
                textelement(Filler44) { }
                textelement(Filler45) { }
                textelement(Filler46) { }
                textelement(Filler47) { }
                textelement(Filler48) { }
                textelement(Filler49) { }
                textelement(Filler50) { }
                textelement(Filler51) { }
                textelement(Filler52) { }
                textelement(ItemName2) { }
                textelement(Filler53) { }
                textelement(Filler54) { }
                textelement(Filler55) { }
                textelement(Filler56) { }
                textelement(Filler57) { }
                textelement(Filler58) { }
                textelement(Filler59) { }
                textelement(Filler60) { }
                textelement(Filler61) { }
                textelement(Filler62) { }
                textelement(Filler63) { }
                textelement(Filler64) { }
                fieldelement(PostingDate; AutotaskImportJournal."Posting Date") { }
                textelement(Filler65) { }
                textelement(Filler66) { }
                textelement(Filler67) { }

                trigger OnBeforeInsertRecord()
                var
                    Customer: Record Customer;
                    Resource: Record Resource;
                    ResourceName: Text[50];
                    i: Integer;
                begin
                    with AutotaskImportJournal do begin
                        EntryNo += 1;
                        "Entry No." := EntryNo;
                        if "Ticket Summary" = '' then
                            "Ticket Summary" := DelStr(StrSubstNo('%1 - %2', ItemName1, ItemName2), 250);

                        Customer.SetRange("Autotask ID", "Client ID");
                        Customer.SetRange("Global Dimension 1 Code", DimValCode);
                        if Customer.FindFirst() then
                            "Client No." := Customer."No.";

                        // Set the Resource Type
                        "Line Type" := "Line Type"::Item;
                        if "Resource Type" = 'Labor' then begin
                            "Line Type" := "Line Type"::Resource;
                            ResourceName := DelChr(SelectStr(2, "Resource Name"), '<>', ' ') + ' ' + DelChr(SelectStr(1, "Resource Name"), '<>', ' ');
                            Resource.SetRange(Name, ResourceName);
                            if Resource.FindFirst() then
                                "Line No." := Resource."No.";
                        end;

                        // Set the NAV description
                        Description := DelStr("Ticket Summary", 50);
                        if (StrLen("Ticket Summary") < 50) and (CopyStr("Ticket Summary", 51, 1) <> ' ') then begin
                            i := 51;
                            repeat
                                i -= 1;
                            until (CopyStr(Description, i, 1) = ' ') or (i = 1);
                            if i > 1 then
                                Description := DelChr(DelStr(Description, i), '<>', ' ');
                        end;

                        // Check for items
                        if "Line Type" = "Line Type"::Item then begin
                            Evaluate(Quantity, ItemQuantity);
                            Rate := Amount / Quantity;
                        end;

                        "Import Date" := CurrentDateTime();
                    end;
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(General)
                {
                    field(DimValCode; DimValCode)
                    {
                        TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = const (1));
                        CaptionClass = '1,1,1';
                    }
                }
            }
        }
    }

    trigger OnPreXMLPort()
    begin
        with AutotaskImportJournal do begin
            DeleteAll();
        end;
    end;

    var
        DimValCode: Code[20];
        EntryNo: Integer;
}