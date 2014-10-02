@ECHO CompileCW Updated: Feb/28/2014 
@ECHO Curr Drive\Dir
@CD
@ECHO OFF
ECHO\
ECHO CompileCW.cmd %*
ECHO Usage:
ECHO Arg 1 - BuildWhat   - Should be FullPath to SLN or CWProj
ECHO Arg 2 - BuildConfig - Should be RELEASE or DEBUG
ECHO Arg 3 - CWRoot      - Path to CW
ECHO Arg 4 - CWVer       - Values like: [Clarion 8.0.9759], or [] for CurrentVersion
ECHO\
ECHO Called With:
ECHO Arg 1 - BuildWhat   - [%1]
ECHO Arg 2 - BuildConfig - [%2]
ECHO Arg 3 - CWRoot      - [%3]
ECHO Arg 4 - CWVer       - [%4]
ECHO\
CALL :SetAndParseBuildWhat  %1
SET BuildWhatDir=%BuildWhatDir:~0,-1%
::REM ---------------------
::SET RedirSection=Debug
SET RedirSection=%2
::SET BuildFolder=C:\Windows\Microsoft.NET\Framework\v2.0.50727
SET BuildFolder=C:\Windows\Microsoft.NET\Framework\v4.0.30319
:: SET CWRoot=C:\SV\Clarion9
::SET CWVer=Clarion 8.0.9759
SET CWRoot=%3
::--------------------
SET Properties=
::--------------------
::-------------------- experimental
::--------------------
:: SET Properties=/maxcpucount:2 /clp:ShowTimeStamp
:: SET Properties=/maxcpucount:2 
CALL :AddProperty 		redirection_ConfigDir    	    "%CWRoot%\Settings"
:: CALL :AddProperty               BuildInParallel          true
::--------------------
::-------------------- experimental -end
::--------------------
CALL :AddProperty 		Configuration    	"%RedirSection%"
CALL :AddProperty 		clarion_Sections 	"%RedirSection%"
CALL :AddProperty 		SolutionDir      	"%BuildWhatDir%"
CALL :AddProperty 		ClarionBinPath   	"%CWRoot%\Bin"
CALL :AddProperty 		NoDependency     	true

CALL :AddProperty 		Verbosity	    	diagnostic
CALL :AddProperty       WarningLevel      1

::----
:: Doc says that it will use the most current, if this property is not explicity SET
::@CALL :AddProperty  clarion_version "%CWVer%"
::---
::
::------------- BUILD IT
@ECHO ----------------------- Current folder
CD
@ECHO ----------------------- Current folder
@ECHO %Properties%
%BuildFolder%\MSBuild 	%BuildWhat% 		%Properties% 
@ECHO ----------------------- Current folder
CD
@ECHO ----------------------- Current folder
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
@REM v--- SET current drive
%~d1
@REM ^--- SET current folder
CD %~p1
EXIT /B
)

:SetAndParseBuildWhat <DriveDirSolution>
(
SET BuildWhat=%~nx1
CALL :SetCurrPath %1
SET BuildWhatDir=%~dp1
EXIT /B
)
::==============================================================================
:DONE
