Add-Mapping
-------------

Purpose: add JSON->Objective-C mapping information to the properties in JSON object tree.
    
    fs = require 'fs'
    hashes = require 'hashes'
    _ = require('underscore')._
    
TODO: put this in a env.json
    
    files = [
      "output/Analytics.json",
      "output/Identity.json",
      "output/Messaging.json",
      "output/Commerce.json",
      "output/Media.json",
      "output/Syndicate.json"
    ]
    
A little function to convert a string to lower case

    firstToLowerCase = (str) ->
      string = str.substr(0, 1).toLowerCase() + str.substr(1)
      string  

Mapping table: from .Net type to Objective-C type
    
    typeMapping = new hashes.HashTable()
    typeMapping.add("System.Byte", "NSNumber")
    typeMapping.add("System.Int32", "NSNumber")
    typeMapping.add("System.Int16", "NSNumber")
    typeMapping.add("System.Int64", "NSNumber")    
    typeMapping.add("System.String", "NSString")
    typeMapping.add("System.DateTime", "NSDate")
    typeMapping.add("System.Boolean", "NSNumber")
    typeMapping.add("System.Guid", "NSString")
    typeMapping.add("enumList", "NSNumber")
    

Special rules for the edge cases

    #"Identity.Installation" has both "Id" and "InstallationId"
    propertyNameMappingOverride = {
      'InstallationId': 'appInstallationId'
    }
    
Special rule: ArticleInteraction does not have an unique ID. Here we use a combination of articleID and interationTypeID to uniquely identify an ArticleInteraction.
    
    ## Override dbKey for mapped objects
    dbKeyOverride = {
    	'ArticleInteraction': 'return [NSString stringWithFormat:@"Phoenix/Article/%@/ArticleInteraction/%@", self.articleID, self.interactionTypeID];'
    }
    


Takes a JSON object, inspects its properties, add corresponding Obj-C mapping to that object.    
    
    addMapping = (entity) ->
      
      entityName = entity.name
      
Prefixed with 'TS'
      
      ObjCName = 'TS' + entityName 
      entity.ObjCName = ObjCName  
      

Check if there's an exception rule to unique DB key 

      
      dbKey = dbKeyOverride[entity.name]
      if dbKey
        entity.dbKey = dbKey
    	

Enumerate properties

      
      for property in entity.properties
        name = property.name
        type = property.type
        
String magic to make the property name follow Objective-C conventions.

        
Naming conventions: object.uniqueID, object.myGreatProperty

        
        # name mapping
        ObjCPropertyName = firstToLowerCase name
        
        if propertyNameMappingOverride[name]
          ObjCPropertyName = propertyNameMappingOverride[name]
        
Handle reserved method names: -id becomes -objectID, -description becomes -objectDescription
        
        
        if ObjCPropertyName is "id"
          ObjCPropertyName = firstToLowerCase(entity.name) + "ID"
        if ObjCPropertyName is "description"
          ObjCPropertyName = firstToLowerCase(entity.name) + "Description"
        
convention: capitalize ID, e.g. articleID 

        ObjCPropertyName = ObjCPropertyName.replace /Id/,"ID"
        
type mapping

if it's a normal type (string, dates, etc.)

        if (typeof type is "string") and (typeMapping.get(type) isnt null)
          property.ObjCPropertyType = typeMapping.get(type)['value']

expandable array
      
        if type is 'relationship.array'
          ObjCPropertyType = (firstToLowerCase name)
          property.ObjCPropertyType = 'NSArray'
          property.ObjCArrayPropertyContentType = (property.href.replace /#/,'TS')
          
expandable properties

        else if type is 'relationship'
          ObjCPropertyType = 'TS' + name
          property.ObjCPropertyType  = ObjCPropertyType
        
        property.ObjCPropertyName = ObjCPropertyName 
      
      

Main function when running this script

Iterate over the given files, call addMapping(), save to disk.

      
    for file in files
      array = JSON.parse(fs.readFileSync(file, 'utf8'));
      for entity in array
        addMapping entity
          
      serializedText = JSON.stringify array,undefined,4
      console.log('writing to ' + file)
      fs.writeFileSync(file, serializedText)