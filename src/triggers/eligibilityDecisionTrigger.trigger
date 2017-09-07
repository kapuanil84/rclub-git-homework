trigger eligibilityDecisionTrigger on Eligibility_Decision__c (after update, after Insert,after delete) {
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            //blogicEligibilityDecision.generateIDCards(trigger.oldMap, trigger.new);
            blogicEligibilityDecision.demoGraphicUpdates(trigger.new,trigger.oldMap);
        }
        if(trigger.isInsert){
            blogicEligibilityDecision.generateMemberId(trigger.new);
        }
        if(trigger.isDelete){
            blogicEligibilityDecision.deleteIntegrationFile(trigger.old);
        }
    }

}