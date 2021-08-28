%%

%unicode

%class FlexLexer

%int
%state
%line
%column


%{

%}

%eof{

%eof}
%eofclose

letter = [A-Za-z]
digits = [0-9] 
identifier = [a-zA-z0-9]
new_line = \n|\r|\n\r
id = (^{letter}{identifier}*"_"?{identifier}*)*

%%


<YYINITIAL> {
	
}