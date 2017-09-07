trigger EligibilityConditionTrigger on Eligibility_Condition__c (before insert,after delete,before delete) {

    if(trigger.isBefore){
        if(trigger.isDelete){
            blogicEligibilityCondition.demoGraphicUpdates(trigger.old);
        }
    }
}