Aggregate URLs from C# source code, save to JSON files
______________________________________________________

This is a simple parser script that uses regex to inspect a source file and extract URLs

    # Parser = require "simple-text-parser"
    fs = require "fs"
    url = require "url"
    #VerEx = require("verbal-expressions");
    
    #beginRegionEx = VerEx().startOfLine().multiple(" ").then("#region").multiple(" ").then("\"").word().then("\"").anything()
    
    # matches         #region "ActivateModule"
    # beginRegionRegex = /^\s+\#region\s\"[\w]+"/im

matching Description(xxxxx)
    
    descriptionRegex = /\[Description\(\"\w+\"\)\]/i
    
matching         public const string ListActivity = "/projects/{projectId}/activity"; 

    methodPathRegex = /^\s+public const string.+"\/.+"/im
    
matching        public const string ListActivityVerb = "GET"; 

    methodVerbRegex = /^\s+public const string.+"\w+"/im
    
extract		what's in between "quotes"

    extractionRegex = /".*?"/g
    
TODO put in phoenix-config.json
    
    paths = [
    	"PhoenixSRC/PhoenixAnalyticsServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixCommerceServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixDataCaptureServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixIdentityServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixMediaServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixMessagingServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixProjectServiceEndPoint.cs",
    	"PhoenixSRC/PhoenixSyndicateServiceEndPoint.cs"
    ]
    
    
    handler = (path, data) ->
    	methods = []
    	methodName = ""
    	methodPath = ""
    	methodVerb = ""
    	
    	lines = data.split "\n"
    	for aLine in lines
    
    		if methodPathRegex.test(aLine)
    			# console.log aLine
    			if (!newMethod)
    				newMethod = {}
    				# newMethod.name = methodName
    				# methods.push newMethod
    			methodPath = aLine.match(extractionRegex)[0].split("\"").join("")
    			newMethod.path = methodPath
    			continue
    
    		if methodVerbRegex.test(aLine)
    			# console.log aLine
    			methodVerb = aLine.match(extractionRegex)[0].split("\"").join("")
    			newMethod.verb = methodVerb
    			continue
    			
    		if descriptionRegex.test(aLine)
    			# console.log aLine
    			# newMethod = {}
    			methodName = aLine.match(extractionRegex)[0].split("\"").join("")
    			newMethod.name = methodName
    			methods.push newMethod
    			newMethod = false
    			continue
    			
    	serializedText = JSON.stringify methods,undefined,4
    		
    	urlparts = url.parse(path, true)
    	filename =  urlparts.path.split('/').pop()
    	filename = filename.split('.')[0] # strip .cs file extension
    	filename = filename + '.json'
    	console.log('writing to ' + filename)
    	fs.writeFileSync("output/" + filename, serializedText)
    	
    
    for path in paths
    	data = fs.readFileSync(path, "utf8")
    	if data
    		handler path, data
    