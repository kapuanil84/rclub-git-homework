/**
 * Name             :   ContactTrigger 
 * Created Date     :   02/17/2017
 * Updated Date     :   
 * Created By       :   Anil Choudary
 * Updated By       :   
 * Dependencies     :
 * Description      :   This is the Trigger which will have all the records inserted
 *                                     
 */

trigger ContactTrigger on Contact (before insert, before update, after delete, after insert) {
   
    // Trigger before action ie. below code will execute when trigger is before
    if(trigger.isBefore)
    {
        // if records is getting inserted
        if (trigger.isInsert)
        {
            // creating person account
            blogicContact.createAccountPerson(trigger.new);
            
            // checking  applicant photo
            blogicContact.checkApplicantPhoto(trigger.new);
            
            // creating contac address
            copyContactAddress c= new copyContactAddress();
            c.copyContactMailingAddress(trigger.new);
        }

        if (trigger.isUpdate)
        {
            blogicContact.demoGraphicUpdates(trigger.new,trigger.oldMap);
            blogicContact.checkApplicantPhoto(trigger.new); 
            copyContactAddress c= new copyContactAddress();
            c.copyContactMailingAddress(trigger.new);
        }
    }
    
    // Trigger After action ie. below code will execute when trigger is after
    if (trigger.isAfter)
    {
        if (trigger.isDelete)
        {
            // if contact i getting deleted then we have to delete the person account
            blogicContact.deleteAccountPerson(trigger.old);
        }
        
        // Added for the user story #
        if (Trigger.isInsert)
        {
            ContactTriggerHandler.afterInsertHandler(trigger.newmap);
        }
    }

}