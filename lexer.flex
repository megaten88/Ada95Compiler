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
	"procedure"   {return Procedure;}
	"begin"   {return Begin;}
	"end"     {return End;}
	"in"      {return In;}
	"out"     {return Out;}
	"in out"    {return In_Out;}
	"is"      {return Is;}
	"if"      {return If;}
	"then"    {return Then;}
	"else"    {return Else;}
	"elsif"   {return Else_If;}
	"return"  {return Return;}
	"function"    {return Function;}
	"for"     {return For;}
	"loop"    {return Loop;}
	"put"         {return Put;}
	"get"         {return Get;}
	"case"        {return Case;}
	"when"        {return When;}
	"exit"        {return Exit;}
	"not"         {return Not;}

}