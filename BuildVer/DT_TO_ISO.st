
(* TODO: Add your comment here *)
FUNCTION DT_TO_ISO
	
	Str	:=	'';
	
	DT_TO_DTStructure(DT1,ADR(DT1Struct));
	sVar	:=	UINT_TO_STRING(DT1Struct.year);
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,'-');
	
	sVar	:=	USINT_TO_STRING(DT1Struct.month);
	IF DT1Struct.month < 10 THEN
		Str	:=	CONCAT(Str,'0');
	END_IF;
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,'-');
	
	sVar	:=	USINT_TO_STRING(DT1Struct.day);
	IF DT1Struct.day < 10 THEN
		Str	:=	CONCAT(Str,'0');
	END_IF;
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,'T');
	
	sVar	:=	USINT_TO_STRING(DT1Struct.hour);
	IF DT1Struct.hour < 10 THEN
		Str	:=	CONCAT(Str,'0');
	END_IF;
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,':');
	
	sVar	:=	USINT_TO_STRING(DT1Struct.minute);
	IF DT1Struct.minute < 10 THEN
		Str	:=	CONCAT(Str,'0');
	END_IF;
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,':');
	
	sVar	:=	USINT_TO_STRING(DT1Struct.second);
	IF DT1Struct.second < 10 THEN
		Str	:=	CONCAT(Str,'0');
	END_IF;
	Str	:=	CONCAT(Str,sVar);
	Str	:=	CONCAT(Str,'.000Z');
		
	brsmemcpy(pStr,ADR(Str),length);
	DT_TO_ISO	:=	LEN(Str);
	
END_FUNCTION
