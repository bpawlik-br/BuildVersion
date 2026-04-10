
{REDUND_ERROR} FUNCTION DT_TO_ISO : UDINT (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		DT1 : DATE_AND_TIME;
		pStr : UDINT;
		length : UDINT;
	END_VAR
	VAR
		DT1Struct : DTStructure;
		sVar : STRING[25];
		Str : STRING[25];
	END_VAR
END_FUNCTION
