@isTest
private class TestVerifyDate {
    

@IsTest static void testCheckDates() {
    Date date1 = Date.newInstance(2000, 1, 1);
    Date date2 = Date.newInstance(2000, 1, 15);
    Date date3 = Date.newInstance(2000, 1, 31);
    Date date4 = Date.newInstance(2000, 2, 1);

    System.assertEquals(date2, VerifyDate.CheckDates(date1, date2));
    System.assertEquals(date3, VerifyDate.CheckDates(date1, date4));
  }
}