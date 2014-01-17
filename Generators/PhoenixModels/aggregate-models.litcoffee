## This document is written in [Literate Coffeescript](http://coffeescript.org/#literate)  

### Why use Literate Coffeescript, not Objective-C, JS, .Net, language X

Coffee script **is** javascript -- it compiles one-to-one into the equivalent JS.

Using Javascript to write generators allow both frontend and backend developers to work on this.

Javascript is natural for working with API documentations (HTML DOMs), JSON and text.

Javascript runs on all platforms. No Windows vs. Mac vs. Linux arguments here.

Bonus: literate coffeescript puts Markdown documentation above code. Hence, the code is self explanatory, even to non-developers.


    request = require 'request'
    cheerio = require 'cheerio'
    fs = require 'fs'
    url = require 'url'
    

env.json defines a set of URLs containing Phoenix API documentations.

using different config.json allows us to switch between environments (live, uat, dev, whatever)

    # config = JSON.parse(fs.readFileSync('config.json', 'utf8'))
    config = JSON.parse(fs.readFileSync('env-uat.json', 'utf8'))
    
    urls = config.urls
    

print out all URLs that this script is working with
    
    console.log urls

this function takes a response which is an API webpage, and extracts content from it.
    
    func = (error, response, body) ->
      
      if error
        consoloe.log error
        return
      

DOM magic      

      # each section correspond to a class
      $ = cheerio.load(body)
      sections = $ 'section'
      
      

Each DOM section corresponds to a type, such as "Project", "User" or "Article"

The resulting JSON model is saved in "allModels" array

      
      allModels = []
      
      for aSection in sections
      
Scrape the DOM and convert it into a model in JS
      
        model = {}
        model.name = $(aSection).attr 'id'
        # console.log model.name
        
Navigate through DOM to extract content    
    
All properties are contained in a table

        model.properties = []
        table = $(aSection).find('table')[0]
        tbody = $(table).find('tbody')[0]
        # rows = $(tbody).find('tr')
        rows = $(tbody).children()
        
Each row describes the property's name, type (integeter, string, ...) and possible values.
        
        
        for aRow in rows
          newProperty = {}
          newProperty.name = $(aRow.children[0]).text()
          typeTD = aRow.children[1]
          if typeTD
            typeAnchor = $(aRow.children[1]).find('.systype')[0]
            
If the type is not an URL link, it's a primitive type (e.g. string, numbers) 
            
            if typeAnchor
              type = $(typeAnchor).text()
              newProperty.type = type
            else
            
Otherwise, it is either an enum or relationship
            
              # This is not a primitive type
              # may be a enum
              anchor = $(aRow.children[1]).find('a')[0]
              if (anchor)
                href = $(anchor).attr('href')
                if href.match("enum") is null
                  # this is a link
                  newProperty.anchor = response.request.uri.path + href
                  newProperty.type = "relationship"
                else

this is a enum

                  enumList = {name:$(anchor).text(), type:"enum"}
                  enumList.values = []
                  
                  enumRows = $(aRow.children[1]).find('tr')
                  
The first row is table header 
                  
                  for enumRow in enumRows
                    tds = $(enumRow).find('td')
                    
Skip empty row

                    if tds.length is 0
                      continue
                      
                    enumList.values.push $(tds[0]).text()
                  
TODO: extract enum value as well
                  
                  newProperty.enumList = enumList
                  newProperty.type = "enumList"
                  
                newProperty.href = $(anchor).attr('href')
              
              # or a relation ship to other Object. E.g. article.section
              # we will ignore the relationshiop, and use article.sectionId instead
          else
            # console.log('This row ' + $(aRow).text() + 'doesn't have type anchor')
          model.properties.push newProperty
        
        allModels.push model
    

Serialize and save to disk
    
        
      serializedText = JSON.stringify allModels,undefined,4
        
      urlparts = url.parse(response.request.uri.path, true)
      filename=  urlparts.path.split('/').pop()
      filename = filename + '.json'
      console.log('writing to ' + filename)
      fs.writeFileSync("output/" + filename, serializedText)
        
    
    for apiUrl in urls
      request apiUrl,func