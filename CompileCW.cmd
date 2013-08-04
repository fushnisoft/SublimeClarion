@ECHO OFF
CALL :SetAndParseBuildWhat  %1
::v-- remove trailing / from BuildWahtDir (for some reason, I can't seem to get this to work in the procedure)
SET BuildWhatDir=%BuildWhatDir:~0,-1%
::---------------------
Set RedirSection=Debug
Set BuildFolder=C:\Windows\Microsoft.NET\Framework\v2.0.50727
Set CWRoot=C:\SV\Clarion8
::Set CWVer=Clarion 8.0.9759
::---------------------
Set Properties=
CALL :AddProperty 		Configuration    	"%RedirSection%"
CALL :AddProperty 		clarion_Sections 	"%RedirSection%"
CALL :AddProperty 		SolutionDir      	"%BuildWhatDir%"
CALL :AddProperty 		ClarionBinPath   	"%CWRoot%\Bin"
CALL :AddProperty 		NoDependency     	true
::----
:: Doc says that it will use the most current, if this property is not explicity set
::@CALL :AddProperty  clarion_version "%CWVer%"
::---
::
::------------- BUILD IT
CD
%BuildFolder%\MSBuild 	%BuildWhat% 		%Properties%
::%BuildFolder%\MSBuild 	%BuildWhat% 		%Properties%
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
	::v--- set current drive
	%~d1
	::v--- set current folder
	CD %~p1
	EXIT /B
)

:SetAndParseBuildWhat <DriveDirSolution>
(
	Set BuildWhat=%~nx1
	CALL :SetCurrPath %1
	Set BuildWhatDir=%~dp1
	::TODO, remove trailing / from BuildWahtDir
	::Set Y=%BuildWhatDir:~0,-1%
	::ECHO Y is %Y%
	EXIT /B
)
::==============================================================================
:DONE
