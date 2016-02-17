%{
	#include "myscanner.h"
%}

%%
:		return COLON;
"name"	return NAME;
"db"	return DATABASE;
"port"	return PORT;
"table"	return TABLE;
"pwd"	return PASSWORD;
[0-9]*	return INTEGER;
.		printf("Unexpexted sequence\n");
%%