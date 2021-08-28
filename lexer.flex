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
new_line = \n
id = ({letter}{digits}"_")*

%%


<YYINITIAL> {
	
}