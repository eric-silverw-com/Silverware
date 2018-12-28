report 50100 "Autotask Test Report"
{
    Caption = 'Autotask Test Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, All;
    RDLCLayout = 'RDL\Autotask Test Report.rdl';

    dataset
    {
        dataitem(AutotaskImportJournal; "Autotask Import Journal")
        {
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(Autotask_Import_Journal_Entry_No_; "Entry No.") { }
            column(Autotask_Import_Journal__Client_Name_; "Client Name") { }
            column(Autotask_Import_Journal__Client_No__; "Client No.") { }
            column(Autotask_Import_Journal_Quantity; Quantity) { }
            column(Autotask_Import_Journal_Rate; Rate) { }
            column(Autotask_Import_Journal_Amount; Amount) { }
            column(Autotask_Import_Journal__Document_Date_; "Document Date") { }
            column(Autotask_Import_Journal__Line_Type_; "Line Type") { }
            column(Autotask_Import_Journal__Line_No__; "Line No.") { }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
    end;

    var
        CompanyInformation: Record "Company Information";
}