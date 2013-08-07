# Installation

## via Package Control

> This is the recommended installation method.

If you have Sublime Package Control, you should know what to do. [read about it here](http://wbond.net/sublime_packages/package_control).

After installing the package and restarting the editor:

* Open the Command Pallete (`ctrl+shift+P` or `cmd+shift+P`).
* Type "Install Package" and hit return.
* Type "Clarion" and hit return.

------------------------
CompileCW.cmd usage

Project->EditProject to open your  <projName>.sublime-project
and add the following, where you alter give the absolute path to YOUR .sln

	"build_systems":
	[
	  {
	      "name": "Clarion",                                   

	      //name your sublime-project the same as your .sln
	       "cmd": [ "${packages}\\Clarion\\CompileCW.cmd", "${project/\\.sublime-project/\\.sln/}"],

	      //hard coded exmaple
	      //"cmd": [ "${packages}\\Clarion\\CompileCW.cmd", "c:\\HG\\TSI\\CW\\Est\\B47.sln"],

	      //Appropriate for MSBuild in general
	      "file_regex": "^\\s*(.*)\\(([0-9]*),([0-9]*)" 
	   }
	]

Then you can use CTRL+B or F7 to compile
You can double click on error lines to navigate to the bug
