trigger RTABrochureRequestTrigger on RTA_Brochure_Request__c (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            blogicRTABrochureRequest.generateBrochure(trigger.new);
        }
    }
}