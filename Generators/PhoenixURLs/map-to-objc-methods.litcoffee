Add generated objc method names to JSON model
-----------------------------------------

   
    fs = require 'fs'
    hashes = require 'hashes'
    url = require 'url'
    _ = require('underscore')._
    



    files = [
    	"output/PhoenixAnalyticsServiceEndPoint.json",
    	"output/PhoenixCommerceServiceEndPoint.json",
    	"output/PhoenixDataCaptureServiceEndPoint.json",
    	"output/PhoenixIdentityServiceEndPoint.json",
    	"output/PhoenixMediaServiceEndPoint.json",
    	"output/PhoenixMessagingServiceEndPoint.json",
    	"output/PhoenixProjectServiceEndPoint.json",
    	"output/PhoenixSyndicateServiceEndPoint.json"
    ]
    
    
Helper functions
    
    firstToLowerCase = (str) -> 
    	string = str.substr(0, 1).toLowerCase() + str.substr(1)
    	string	
    	
    firstToUpperCase = (str) -> 
    	string = str.substr(0, 1).toUpperCase() + str.substr(1)
    	string	
    	
    	
    addObjCMethod = (request) ->
    	name = request.name
    	path = request.path
    	verb = request.verb
    	
    	if not path
    		console.log "skipping " + name + " because URL path is unavailable"
    		return
    	
    	#detect queries e.g. project/id/listArticles?sortby=modify
    	# break it into pathName?query
    	parsedPath = url.parse path
    	
    	pathName = parsedPath.pathname
    	
    	if parsedPath.query isnt null
    		query = parsedPath.query
    	
    	# string is the generated ObjC method name
    	string = "- (void)"
    	string += firstToLowerCase name # e.g. listSections
    	
    	# extract parameters in array  e.g. project/{projectid} -> {projectid}
    	params = pathName.match /{\w+}/ig
    	
    	console.log verb + ': ' + path
    	
    	# convert pathName into ObjC method
    	
    	if params isnt null and params.length
    		string += "With"
    		
    		for aParam, i in params		
    		
    			aParam = aParam.replace /[{}]/ig, ""
    			aParam = aParam.replace /Id/i,"ID" # objectid -> objectID
    		
    			nameWithoutVerb = name.replace /Create|Get|List|Update|Delete|Send|Activate|Deactivate/i,""
    			
    			if aParam.toUpperCase() == "id".toUpperCase()
    				aParam = nameWithoutVerb + firstToUpperCase(aParam)
    			
    			if i is 0
    				string += firstToUpperCase(aParam) + ":"
    			else
    				string += firstToLowerCase(aParam) + ":"
    				
    			string += " (NSNumber *)" + firstToLowerCase(aParam) + " "
    	
    	# convert uri query into ObjC parameters
    
    	if query and (query isnt null)	
    		# /articles?modified={dateString}+sectionname={sectionname} -> ['{dateString}', '{sectionname}']
    		queries = query.match /{\w+}/ig
    
    		for aQuery in queries
    			aQuery = aQuery.replace /[{}]/ig, ""
    			string += firstToLowerCase(aParam) + ":"
    			string += " (NSString *)" + firstToLowerCase(aParam) + " "
    	
    	if params is null or params.length is 0
    		string += 'WithCompletion:'
    	else
    		string += "completion:"
    	
    	console.log 'mehtod: ' + string
    	
    	request.ObjCMethod = string
    	
Entry point
      
      
    for file in files
    	array = JSON.parse(fs.readFileSync(file, 'utf8'));
    	for entity in array
    		addObjCMethod entity
    			
    	serializedText = JSON.stringify array,undefined,4
    	console.log('writing to ' + file)
    	fs.writeFileSync(file, serializedText)