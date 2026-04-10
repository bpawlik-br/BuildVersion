
ACTION actLogVersion: 

	GetLogbookIdent.Name := '$$arlogusr';
	GetLogbookIdent.Execute := TRUE;
	GetLogbookIdent();

	Message := BuildVersion.Git.Describe;
	Message := CONCAT(Message, ' (');
	Message := CONCAT(Message, BuildVersion.Git.Branch);
	Message := CONCAT(Message, ', ');
	
	IF BuildVersion.Git.ChangeWarning THEN
		WriteToLogbook.EventID := ArEventLogMakeEventID(arEVENTLOG_SEVERITY_WARNING, 400, 10000);
		//WriteToLogbook.EventID := ArEventLogMakeEventID(arEVENTLOG_SEVERITY_WARNING, 0, 0);
		Message := CONCAT(Message, 'dirty, ');
	ELSE
		WriteToLogbook.EventID := ArEventLogMakeEventID(arEVENTLOG_SEVERITY_INFO, 400, 10000);
		//WriteToLogbook.EventID := ArEventLogMakeEventID(arEVENTLOG_SEVERITY_INFO, 0, 0);
		Message := CONCAT(Message, 'clean, ');
	END_IF;

	DT_TO_ISO(BuildVersion.Project.BuildDateUTC,ADR(sBuildDate),SIZEOF(sBuildDate));
	Message := CONCAT(Message, sBuildDate);
	Message := CONCAT(Message, ')');
	
	WriteToLogbook.AddDataSize := LEN(Message) + 1;
	
	WriteToLogbook.Ident := GetLogbookIdent.Ident;
	WriteToLogbook.AddDataFormat := arEVENTLOG_ADDFORMAT_TEXT;	
	WriteToLogbook.AddData := ADR(Message);
	WriteToLogbook.ObjectID := 'BuildVersion';
	WriteToLogbook.Execute := TRUE;
	WriteToLogbook();
	
	GetLogbookIdent.Execute := FALSE;
	GetLogbookIdent();
	WriteToLogbook.Execute := FALSE;
	WriteToLogbook();
	
END_ACTION
