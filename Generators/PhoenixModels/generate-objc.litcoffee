add mapping information to the properties in JSON object tree
    
    fs = require 'fs'
    hashes = require 'hashes'
    _ = require('underscore')._
    mkdirp = require 'mkdirp'
    Handlebars = require 'handlebars'
    moment = require 'moment'
    async = require 'async'


TODO: put this in config.json
    
    files = [
    	"output/Analytics.json",
    	"output/Identity.json",
    	"output/Messaging.json",
    	"output/Commerce.json",
    	"output/Media.json",
    	"output/Syndicate.json"
    ]
    
These are excluded because of duplication

**Project** is a class in Identitiy, which other modules re-uses.

EventLogAggregate is empty in Documentation site...
    
    excludedClasses = [
    	'Analytics/Project',
      'Analytics/Action',
      'Analytics/EventLogAggregate',
    	'Messaging/Project',
    	'Commerce/Project',
    	'Media/Project',
    	'Syndicate/Project',
    	'Commerce/Application'
    ]
    
A few outliers that don't follow convention
    
    identifierOverride = {
    	'ProjectAccountMap': 'accountID',
    	'ArticleInteraction': 'createDate'
    }
    
    
    collectionNameOverride = {
    	
    }

All generated models are saved in this object
    
    allObjCModels = {'modelNames':[]}
    
Load handlebar.js templates
    
    headerTemplateString = fs.readFileSync('templates/header.hbs', 'utf8')
    headerTemplate = Handlebars.compile headerTemplateString 
    
    bodyTemplateString = fs.readFileSync('templates/body.hbs', 'utf8')
    bodyTemplate = Handlebars.compile bodyTemplateString 
    
    modelsImportTemplateString = fs.readFileSync('templates/models-import.hbs', 'utf8')
    modelsImportTemplate = Handlebars.compile modelsImportTemplateString  
    

Helper function
    
    firstToLowerCase = (str) -> 
    	string = str.substr(0, 1).toLowerCase() + str.substr(1)
    	string	

Handlebar.js template helper: generate Obj-C ENUM programatically
    
    Handlebars.registerHelper 'generate_enum', func = () ->
    	str = ''
    	
    	if this.type is 'enumList'
    		str += '#ifndef ' + this.name + 'Enum' + '\n'
    		str += '#define ' + this.name + 'Enum' + '\n'
    		
    		str += 'typedef NS_ENUM(NSUInteger, ' + this.name + ') {\n'
    		
    		for value,i in this.enumList.values
          if i is 0
            str += '	k' + this.name + value + ' = 1,\n'
          else
            str += '	k' + this.name + value + ',\n'
    		
    		str += '};\n\n'
    		str += '#endif\n\n'
    	
    	str
    	
Handlebar.js template helper: generate today's date, used in comments at the top of source code
      
    Handlebars.registerHelper 'date', func = () ->
    	moment().format 'MMMM Do YYYY'
    	
      
Handlebar.js template helper: identifier. Each class has its own unique identifier
      
    Handlebars.registerHelper 'identifierPropertyName', func = () ->
    	identifier = identifierOverride[this.name]
    	collectionName = collectionNameOverride[this.name]
    	
    	# template will adapt if there's a collectionName override
    	if collectionName
    		this.collectionName = collectionName
    
    	# assume the identifer is name + ID
    	if identifier
    		console.log '	using identifier override ' + identifier + ' for class ' + this.name
    	else
    		identifier = firstToLowerCase this.name + 'ID'
    	
    	found = false
    	for property in this.properties
    		if property.ObjCPropertyName is identifier
    			found = true
    			break
    	
    	if found isnt true
    		console.log '\nClass ' + this.name + ' does not have a well formed identifier\n'
    		
    		
    	# 
    	identifier
    
Handlebar.js template helper: generat Objective-C properties for primitive types (numbers, strings ...)
    
    Handlebars.registerHelper 'generate_properties', func = () ->
    	str = ''
    	
    	if this.type isnt 'relationship'
    		ObjCPropertyType = this.ObjCPropertyType
    		if ObjCPropertyType
    			if ObjCPropertyType isnt 'NSString'
    				str += '@property (nonatomic, strong) ' + ObjCPropertyType + ' *' + this.ObjCPropertyName
    			else
    				str += '@property (nonatomic, copy) ' + ObjCPropertyType + ' *' + this.ObjCPropertyName
    			str += ';\n'
    	str
    
Handlebar.js template helper: generate properties for relationships (expanded from Phoenix API request)
    
    #generate @property (nonatimic, strong) Project *project
    Handlebars.registerHelper 'generate_expandable_properties', func = () ->
    	str = ''
    	
    	if this.type is 'relationship'
    		ObjCPropertyType = this.ObjCPropertyType
    			
    		str += '@property (nonatomic, strong) ' + ObjCPropertyType + ' *' + this.ObjCPropertyName
    		str += ';\n'
    	str
    	
Handlebar.js template helper: generate a property called - (NSArray *)expandableProperties

This is useful for automation, such as programatically implementing NSCoding
      
    # populate - (NSArray *)expandableProperties
    Handlebars.registerHelper 'generate_expandable_properties_array', func = () ->
    	str = ''
    	for property,i in this.properties
    		if property.type is 'relationship'
    			# ObjCPropertyType = this.ObjCPropertyType	
    			str += '@"' + property.ObjCPropertyName + '"'
    			if i + 1 < this.properties.length
    				str += ',\n'
    	str
    

Handlebar.js template helper: generate @class in header file
    
    # generate @class Project; directives
    Handlebars.registerHelper 'generate_expandable_properties_class_directives', func = () ->
    	str = ''
    	
    	for property,i in this.properties
    		if property.type is 'relationship'
    			ObjCPropertyType = property.ObjCPropertyType
    			
    			str += '@class ' + ObjCPropertyType + ';'
    			if i + 1 < this.properties.length
    				str += '\n'
    	str
    
    
Handlebar.js template helper: generate mapping dictionary, used for deserializing JSON response to native objects

    Handlebars.registerHelper 'generate_mapping_dictionary', func = () ->
    	str = ''
    	# NSDictionary literal
    	
    	for property,i in this.properties
    	      
    		ObjCPropertyName = property.ObjCPropertyName
    		if ObjCPropertyName
    			
          jsonPropertyName = property.name
          
    			propertyInfoString = '@{@"type": @"DotNetType", @"mappedType":@"ObjCType", @"mappedName": @"ObjCName"}'
          
    			if property.type is 'relationship.array'
            
    			  propertyInfoString = '@{@"type": @"DotNetType", @"mappedType":@"ObjCType", @"mappedName": @"ObjCName", @"arrayContentType": @"ObjCArrayContentType"}'
    			  propertyInfoString = (propertyInfoString.replace 'ObjCArrayContentType', property.ObjCArrayPropertyContentType)
            
    			propertyInfoString = propertyInfoString.replace 'DotNetType', property.type
    			propertyInfoString = propertyInfoString.replace 'ObjCType', property.ObjCPropertyType
    			propertyInfoString = propertyInfoString.replace 'ObjCName', property.ObjCPropertyName 
    
    			str += '		@"' + jsonPropertyName+ '" : ' + propertyInfoString  # + '@"' + ObjCPropertyName + '\"'
    			if i + 1 < this.properties.length
    				str += ',\n'
    		
    			
    	str
    
    
Handlebar.js template helper: When class name is "ArticleInteraction", instance name is "articleInteraction" with first letter in lower case.
    
    Handlebars.registerHelper 'instanceName', func = () ->
    	firstToLowerCase this.name
    


Takes a property generate Objective-C source code

    # main work horse
    generateClass = (entity, path, callback) ->
    	
    	moduleName = path.split('/')[1]
    	# e.g. Syndicate/Article
    	classPath = moduleName + '/' + entity.name
    	
    	if ((excludedClasses.indexOf classPath) > -1)
    		console.log '\n 	skipping excluded class ' + classPath + '\n'
    		return
    	
    	
    	ObjCName = entity.ObjCName
    	
    	# generate Obj-C header file
    	result = headerTemplate entity
    	
    	outputFolder = 'output/' + 'ObjC/' + path.split('/')[1] + '/'
    	
    	mkdirp outputFolder
    	
    	file = outputFolder + ObjCName + '.h'
    	console.log('writing to ' + file)	
    	fs.writeFileSync(file, result)
    	
    	# generate Obj-C implementation
    	result = bodyTemplate entity
    	file = outputFolder + ObjCName + '.m'
    	console.log('writing to ' + file)	
    	fs.writeFileSync(file, result)
    	allObjCModels.modelNames.push ObjCName
    	
    	callback
    
    mkdirp 'output/ObjC'
    
## entry point to this script

    for file in files
    	array = JSON.parse(fs.readFileSync(file, 'utf8'));
    	path = file.replace('.json', '/')
    	
    	for entity in array
    		generateClass entity, path
    	
    	# iterator = (entity, callback) -> 
    	# 	generateClass entity, path, callback
    	# 	
    	# finalCallback = (err) -> 
    	# 	if err
    	# 		console.log err
    	# 		
    	# async.eachSeries array, iterator, finalCallback
    	
    
    console.log allObjCModels
    
    result = modelsImportTemplate allObjCModels
    file = 'output/' + 'ObjC/' + 'TSPhoenixModels' + '.h'
    console.log('\nwriting to ' + file)	
    fs.writeFileSync(file, result)
    
    	
    	
    