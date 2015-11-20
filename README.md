# Discussion available on ClarionHub!

Read the announcment and join the discussion at [ClarionHub](http://clarionhub.com/t/clarion-syntax-highlighting-support-in-vscode/480)

# Installation - VSCode

> Install the VSCode extention via the market place. 

Either download it directly and [install manually](https://code.visualstudio.com/docs/extensions/install-extension) or from within VSCode as described on the [Getting Started page](https://code.visualstudio.com/docs/editor/extension-gallery?pub=Fushnisoft&ext=Clarion).

# Installation - SublimeText

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
	       "cmd": [
	       			   "${packages}\\Clarion\\CompileCW.cmd",

	       			   // What to build, convention is the same folder and basename as this sublime-project file, but with a .sln instead
			            "${project/\\.sublime-project/\\.sln/}",
					      //or hard code the absolute path to the sln, for example; //   "c:\\HG\\TSI\\CW\\Est\\B47.sln",

					       // Build Configuration typcially Debug|Release
				 			"Debug",
							// "Release",

							//CWRoot
				         "C:\\SV\\Clarion8",

				         //(Optional) CW_Ver, such as "8.0.9579" will default to current
				         ""
			         ],

	      //Appropriate for MSBuild in general
	      //uses perl style regex: (maybe this) http://www.cs.tut.fi/~jkorpela/perl/regexp.html
         "file_regex": "^\\s*(.*)\\(([0-9]*),([0-9]*)"

	      //"working_dir": "${project_path}:${folder}}",
         //"shell" : true,

         //Documentation on build systems: see http://docs.sublimetext.info/en/latest/reference/build_systems.html
	   }
	]

Then you can use CTRL+B or F7 to compile
You can double click on error lines to navigate to the bug
