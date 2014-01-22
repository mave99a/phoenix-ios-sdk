Model Generators
================

### PhoenixModels

Aggregate all PhoenixModels, generate NSObject subclasses for Phoenix SDK.
TODO: expansion (array)

### PhoenixURLs (work in progress)

Aggregate all API paths.
TODO: automatically generate Objective-C methods.


## How to use these scripts

All scripts are written in [Literate Coffeescript](http://coffeescript.org/#literate). They have .litcoffee file extensions.

In order to run these scripts, you need to have [NodeJS][nodejs] runtime environment and [CoffeeScript][coffeescript].

[nodejs]: http://nodejs.org
[coffeescript]: http://coffeescript.org

In terminal, run individual scripts like this:

  coffee ScriptName.litcoffee

### Why use Literate Coffeescript, not Objective-C, JS, .Net, language X

Coffee script **is** javascript -- it compiles one-to-one into the equivalent JS.

Using Javascript to write generators allow both frontend and backend developers to work on this.

Javascript is natural for working with API documentations (HTML DOMs), JSON and text.

Javascript runs on all platforms. No Windows vs. Mac vs. Linux arguments here. This approach makes sure Android / Windows Phone / Platform X developers can build on top of this effort to build respective SDK.

Bonus: literate coffeescript puts Markdown documentation above code. Hence, the code is self explanatory, even to non-developers.

