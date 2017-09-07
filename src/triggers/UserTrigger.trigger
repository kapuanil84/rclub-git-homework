trigger UserTrigger on User (after insert) {

	if (Trigger.isAfter) {
		if(Trigger.isinsert) {
            BlogicUser.addUserToPublicGroup(Trigger.new);
			BlogicUser.createContact(Trigger.new);
		}
	}		  
}