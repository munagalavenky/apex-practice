trigger AccountDeletion on Account (before delete) {
    for(Account a : [Select Id from Account where Id in (Select AccountId from Opportunity) AND Id in :Trigger.old]){
        System.debug(a);
        Trigger.oldMap.get(a.Id).addError('You can not delete the account which has the Opportunities');
    }
}