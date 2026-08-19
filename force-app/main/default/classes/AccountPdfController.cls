public with sharing class AccountPdfController {

    public Id accountId { get; private set; }

    public Account acct { get; private set; }

    public List<Contact> contacts { get; private set; }

    public List<Opportunity> opps { get; private set; }

    public AccountPdfController() {
        accountId = ApexPages.currentPage().getParameters().get('id');

        if (accountId == null) {
            return;
        }

        // Parent
        acct = [
            SELECT Id, Name, AccountNumber, Type, Industry, Phone,
                   BillingStreet, BillingCity, BillingState,
                   BillingPostalCode, BillingCountry
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        // Child 1: Contacts
        contacts = [
            SELECT Id, Name, Title, Email, Phone
            FROM Contact
            WHERE AccountId = :accountId
            ORDER BY LastName, FirstName
        ];

        // Child 2: Opportunities
        opps = [
            SELECT Id, Name, StageName, CloseDate, Amount
            FROM Opportunity
            WHERE AccountId = :accountId
            ORDER BY CloseDate DESC
        ];

        // For more child objects, add more queries here and new properties
    }
}