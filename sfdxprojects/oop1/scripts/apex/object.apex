List<sObject> lstObjects = new List<sObject>();
lstObjects.add( new Recipe__c(Name='pizza') );
lstObjects.add( new Account(Name='Acme, inc') );

for(sObject obj : lstObjects) {
	system.debug(obj.get('Name'));
}