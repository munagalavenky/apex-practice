trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tsk = new List<Task>();
    for(Opportunity opp : Trigger.new){
        if(opp.StageName == 'Closed Won'){
            Task ts = new Task(Subject='Follow Up Test Task', WhatId= opp.Id);
            tsk.add(ts);
        }
    }
    insert tsk;
}