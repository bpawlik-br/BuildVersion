(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    pawlikb 
 * Created:   April 10, 2026/8:08 AM 
 * Based on original work by Tyler Matijevich
 *********************************************************************************)

PROGRAM _INIT

	//Always log during boot
	actLogVersion;
	
	//On update set alarm
	IF _Revision <> BuildVersion.Git.Describe OR _BuildDate <> BuildVersion.Project.BuildDate THEN
		_Revision	:=	BuildVersion.Git.Describe;
		_BuildDate	:=	BuildVersion.Project.BuildDate;
		//MpAlarmXSet(gAlarmXCore,'UpdateInstalled');
	END_IF;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//Bind to alarm
	BuildVersion.Git.ChangeWarning;
	
	//On update set alarm and log
	IF _Revision <> BuildVersion.Git.Describe OR _BuildDate <> BuildVersion.Project.BuildDate THEN
		_Revision	:=	BuildVersion.Git.Describe;
		_BuildDate	:=	BuildVersion.Project.BuildDate;
		//MpAlarmXSet(gAlarmXCore,'UpdateInstalled');		
		
		actLogVersion;
	END_IF;

END_PROGRAM