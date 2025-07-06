@isTest
public with sharing class TestRestrictContactByName {
     @isTest
    static void testValidContactInsert() {
        // This contact should be inserted successfully
        Contact c = new Contact(FirstName = 'John', LastName = 'Doe');
        insert c;

        Contact inserted = [SELECT Id, LastName FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Doe', inserted.LastName);
    }

    @isTest
    static void testInvalidContactInsert() {
        // This contact should fail due to restricted LastName
        Contact c = new Contact(FirstName = 'Jane', LastName = 'INVALIDNAME');

        try {
            insert c;
            System.assert(false, 'Expected exception not thrown');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'));
        }
    }

    @isTest
    static void testInvalidContactUpdate() {
        // First insert a valid contact
        Contact c = new Contact(FirstName = 'Jake', LastName = 'Smith');
        insert c;

        // Now try updating to invalid name
        c.LastName = 'INVALIDNAME';

        try {
            update c;
            System.assert(false, 'Expected exception not thrown on update');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'));
        }
    }
}