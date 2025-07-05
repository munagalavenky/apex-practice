trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.new.size();
        System.debug(recordCount);
        EmailManager.sendMail('venkylwc@gmail.com', 'Trial head trigger tutorial', recordCount + 'Contact records were inserted');
        System.debug(recordCount+'Post');
    }
    else if (Trigger.isDelete){
        
    }
}