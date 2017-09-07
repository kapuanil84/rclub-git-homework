trigger TaskTrigger on Task (before Update, before insert) {

    if(trigger.isUpdate){
        if(trigger.isBefore){
            blogicTask.acceptRejectProcess(trigger.oldMap, trigger.new);
        }
    }

    if(trigger.isInsert){
      if(trigger.isBefore){
        blogicTask.travelTrainingTaskRelatedCaseUpdate(trigger.new);
      }
    }
}