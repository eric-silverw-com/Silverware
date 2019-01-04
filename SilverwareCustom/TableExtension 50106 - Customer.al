tableextension 50106 "Silverware Customer" extends Customer
{
    fields
    {
        field(50106; "Account Manager"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code;
            Description = 'SIL014';
        }
    }
}