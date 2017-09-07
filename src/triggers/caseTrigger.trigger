trigger caseTrigger on Case (before insert, before update, after insert, after update) {

    system.debug('***In CaseTrigger');
    if(triggerFlags.bypassCaseTrigger)
    {
        system.debug('***ByPass Case Trigger');
        //triggerFlags.bypassCaseTrigger=false;
        return;
    }
    
    if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            blogicCase.caseInits(trigger.new);
        }
        
        if (trigger.isUpdate)
        {
		    triggerFlags.bypassCaseTrigger=true;
		    system.debug('***In CaseTrigger: BeforeUpdate');
            blogicCase.MtsSetStatusUpdateDate(trigger.oldMap, trigger.new);

            blogicCase.validateCaseFields(trigger.oldMap, trigger.new);
            blogicCase.caseAppealPreProcess(trigger.oldMap, trigger.new);
            blogicCase.caseIntegrationSteps(trigger.oldMap,trigger.new);
            blogicCase.caseRTAFormalAppealProcess(trigger.oldMap,trigger.new);
		    triggerFlags.bypassCaseTrigger=false;
        }
    }

    if (trigger.isAfter)
    {
        if (trigger.isInsert) {
		    system.debug('***In CaseTrigger: AfterInsert');
			blogicCase.createCaseTeamMember(trigger.new);
            blogicCase.createCaseApproval(trigger.new);
            blogicCase.createApplicationRequest(null, trigger.new);
            //blogicCase.assignCaseToCaseManager(trigger.new);
        }

        if (trigger.isUpdate)
        {
	        triggerFlags.bypassCaseTrigger = false;
            blogicCase.demoGraphicUpdates(trigger.new,trigger.oldMap);
		    system.debug('***In CaseTrigger: AfterUpdate');
            blogicCase.caseAppealProcess(trigger.oldMap, trigger.new);
            blogicCase.caseCloseProcess(trigger.oldMap, trigger.new);
			//blogicCase.caseRTAFormalAppealsAfterUpdate(trigger.oldMap, trigger.new);
            triggerFlags.bypassCaseTrigger=false;
        }
    }
}