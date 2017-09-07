trigger EventTrigger on Event (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    System.debug(Logginglevel.INFO ,'****** EventTrigger START');
    // for (Event so : Trigger.new) {
    //  //friends remind friends to bulkify
    // }

    if(Trigger.isInsert && Trigger.isBefore){
        EventTriggerHandler.beforeInsert(Trigger.new);
    }
    else if(Trigger.isInsert && Trigger.isAfter){
          EventTriggerHandler.afterInsert(Trigger.new);
    }
    else if(Trigger.isUpdate && Trigger.isBefore){
        EventTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
    else if(Trigger.isUpdate && Trigger.isAfter){
          EventTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
    else if(Trigger.isDelete && Trigger.isBefore){
        EventTriggerHandler.beforeDelete();
    }
    else if(Trigger.isDelete && Trigger.isAfter){
        EventTriggerHandler.afterDelete();
    }
    else if(Trigger.isundelete){

    }

    System.debug(Logginglevel.INFO ,'****** EventTrigger END');

}