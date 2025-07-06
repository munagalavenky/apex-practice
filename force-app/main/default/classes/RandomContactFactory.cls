public class RandomContactFactory {
        public static List<Contact> generateRandomContacts(Integer numOfContacts, String lastNameOfContacts) {
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<numOfContacts;i++) {
            Contact con = new Contact(FirstName = 'Test' + i, LastName = lastNameOfContacts);
            conList.add(con);
        }
        return conList; 
    }
}