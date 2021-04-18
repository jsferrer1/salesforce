System.debug('Display Case');

List<Schema.DescribeFieldResult> listDescribeSObjectResult = new List<Schema.DescribeFieldResult>();
SObjectType objType = Schema.getGlobalDescribe().get('Case');
Map<String,Schema.SObjectField> fieldMap = objType.getDescribe().fields.getMap();

for(String  fieldName : fieldMap.keySet()){
  System.debug('field: ' + fieldName);
	Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
	if(fielddataType.name().toUpperCase() == 'STRING' || fielddataType.name().toUpperCase() == 'TEXTAREA'){
		listDescribeSObjectResult.add(fieldMap.get(fieldName).getDescribe()) ;
	}
}