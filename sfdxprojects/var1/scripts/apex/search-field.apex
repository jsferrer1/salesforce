Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
for (Schema.SObjectType m1 : schemaMap.values()){
    String objName =  String.valueOf(m1);
    // System.debug('object: ' + objName);
    Schema.SObjectType s = (SObjectType) schemaMap.get(objName);
    Map<String,Schema.SObjectField> tfields = s.getDescribe().fields.getMap();
    for (Schema.SObjectField m2 : tfields.values()){
        String fieldName =  String.valueOf(m2).toLowerCase();
        if(fieldName.contains('extended')){
            System.debug(m1 + ' : ' + m2);
        }
    }
}