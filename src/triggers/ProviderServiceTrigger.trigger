trigger ProviderServiceTrigger on Provider_Service__c (before delete) {

    if(trigger.isBefore){
        if(trigger.isDelete){
            blogicProviderService.deleteChildren(Trigger.old);
        }
    }
}