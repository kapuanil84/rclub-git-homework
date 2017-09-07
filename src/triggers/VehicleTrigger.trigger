/***
 * Name             :   VehicleTriggerHandler
 * Created Date     :   02/17/2017
 * Updated Date     :   02/23/2017
 * Created By       :   Anil Choudary
 * Updated By       :   Anil Choudary
 * Dependencies     :
 * Description      :   This trigger will process each record inserted of Vehicle__c object
 *                      All the logic is logic is written in VehicleTriggerHandler
 * 
 */
trigger VehicleTrigger on Vehicle__c (before insert,after insert) {
	
	// creating instance of halndler will will have all the logic
    VehicleTriggerHandler vhandler = new VehicleTriggerHandler();
    
    // before insert block
    if(Trigger.isBefore && Trigger.isInsert){
       vhandler.beforeInsertHnadler(trigger.new);
    }
    
    //after insert block
    if(Trigger.isAfter && Trigger.isInsert){
        vhandler.afterInsertHandler(trigger.new);
    }

   
    
}