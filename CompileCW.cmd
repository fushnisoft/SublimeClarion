@ECHO Curr Drive\Dir
@CD
@ECHO OFF
ECHO\
ECHO CompileCW.cmd %*
ECHO Arg 1 - BuildWhat   - [%1]
ECHO Arg 2 - BuildConfig - [%2]
ECHO Arg 3 - CWRoot      - [%3]
ECHO Arg 4 - CWVer       - [%4]
ECHO\
CALL :SetAndParseBuildWhat  %1
::v-- remove trailing / from BuildWahtDir (for some reason, I can't seem to get this to work in the procedure)
SET BuildWhatDir=%BuildWhatDir:~0,-1%
::---------------------
::SET BuildConfig=Debug
::SET CWRoot=C:\SV\Clarion8
::SET CWVer=Clarion 8.0.9759
SET BuildConfig=%2
SET BuildFolder=C:\Windows\Microsoft.NET\Framework\v2.0.50727
SET CWRoot=%3
SET CWVer=%4
::---------------------
SET Properties=
CALL :AddProperty 		Configuration    	"%BuildConfig%"
CALL :AddProperty 		clarion_Sections 	"%BuildConfig%"
CALL :AddProperty 		SolutionDir      	"%BuildWhatDir%"
CALL :AddProperty 		ClarionBinPath   	"%CWRoot%\Bin"
CALL :AddProperty 		NoDependency     	true
::----
:: Doc says that it will use the most current, if this property is not explicity SET
IF .%CWVer%.==."". GOTO SkipCWVer
IF .%CWVer%.==..   GOTO SkipCWVer
@CALL :AddProperty  clarion_version "%CWVer%"
:SkipCWVer
::---
::
::------------- BUILD IT
ECHO\
@ECHO ON
 %BuildFolder%\MSBuild 		%BuildWhat% 		%Properties%
@ECHO OFF
GOTO DONE
::------------- BUILD IT
::
::Note: MG added SoultionDir after Rick Martin gave me hints on properties
::Note: "Common MSBuild Project Properties"
::         http://msdn.microsoft.com/en-us/library/vstudio/bb629394.aspx
::Note: To get arg parsing info see:  C:..> for /? 
::==============================================================================
::===== Procedures
::==============================================================================
:AddProperty <PropKey> <PropValue>
(
	SET Properties=%Properties% /property:%1=%2
	EXIT /B
)

:SetCurrPath <FileNameWithDriveDir>
(
	::v--- SET current drive
	ECHO Set Drive  [%~d1]
	%~d1
	::v--- SET current folder
 	ECHO Set Folder [%~p1]
	CD %~p1
	EXIT /B
)

:SetAndParseBuildWhat <DriveDirSolution>
(
	SET BuildWhat=%~nx1
	CALL :SetCurrPath %1
	SET BuildWhatDir=%~dp1
	::TODO, remove trailing / from BuildWahtDir
	::SET Y=%BuildWhatDir:~0,-1%
	::ECHO Y is %Y%
	EXIT /B
)
::==============================================================================
:DONE
