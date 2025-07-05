trigger AccountAddressTrigger on Account (before insert, before update) {
if(Trigger.isInsert || Trigger.isUpdate)
{
    for(Account a : Trigger.new){
        if(a.Match_Billing_Address__c == true){
            a.BillingPostalCode = a.ShippingPostalCode;
        }
    }
}
}