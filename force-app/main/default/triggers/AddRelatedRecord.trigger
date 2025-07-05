trigger AddRelatedRecord on Account (after insert, after update) {
List<Opportunity> opplist = new List<Opportunity>();
    List<Account> toProcess = null;
    switch on Trigger.operationType{
        when AFTER_INSERT{
            toProcess = Trigger.new;
        }
        when AFTER_UPDATE{
            toProcess = [Select id,Name from Account where id in :Trigger.New and Id NOT IN (Select AccountId from Opportunity where AccountId IN:Trigger.New)];
        }
    }
    
    for(Account a : toProcess){
        Opportunity opp = New Opportunity(Name = a.Name +'Opp', StageName='Prospecting',CloseDate= System.today().addMonths(1),AccountId=a.Id);
        opplist.add(opp);
    }
    if(opplist.size()>0){
        insert opplist;
    }
}