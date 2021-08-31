import java.io.Reader;
import java.util.HashMap;
// import java_cup.runtime.Symbol;
// import java_cup.sym;

%%

%unicode

%class FlexLexer

%int
%state COMMENT
%line
%column
%ignorecase
%standalone



%{
	/*
	private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    */
    public static HashMap<String, String> errors = new HashMap<>();
%}

//Delimiters
point = "."
semicolon = ";"
colon = ":"
space = " "
comma = ","
equal = "=" 
leftP = "("
rightP = ")"
comment = "--"

//Variables
underscore = "_"
letter = [A-Za-z]
digits = [0-9] 
new_line = \n|\r|\n\r
NUMBER = 0|[1-9]{digits}*
DECIMALS = {NUMBER}{point}{NUMBER}
identifier =  {letter}+({underscore}({letter}|{NUMBER})+)*({letter}|{NUMBER})*
STRING = \"({letter}|{digits}|{space})*\"


//Operators
ASSIGN = ":="
ADD = "+" | "-"
MULT = "*"|"/"|"mod"| "rem" 
BOOL = "true" | "false"
RELATE = ">" | "<" | "==" | ">=" | "<=" | "/="
LOGIC_OP = "and"|"or"|"xor"|"xand"


%%


<YYINITIAL> {
	{comment}		{yybegin(COMMENT);}
	"procedure"   	{System.out.println(yytext() +"\t\t <PROCEDURE>");  }//return symbol(sym.Procedure);}
	"begin"   		{System.out.println(yytext() +"\t\t <BEGIN>");  }//return symbol(sym.Begin);}
	"end"     		{System.out.println(yytext() +"\t\t <END>");  }//return symbol(sym.End);}
	"in"      		{System.out.println(yytext() +"\t\t <IN>");  }//return symbol(sym.In);}
	"out"     		{System.out.println(yytext() +"\t\t <OUT>");  }//return symbol(sym.Out);}
	"in out"    	{System.out.println(yytext() +"\t\t <IN_OUT>");  }//return symbol(sym.In_Out);}
	"is"      		{System.out.println(yytext() +"\t\t <IS>");  }//return symbol(sym.Is);}
	"if"      		{System.out.println(yytext() +"\t\t <IF>"); }//return symbol(sym.If);}
	"then"    		{System.out.println(yytext() +"\t\t <THEN>"); }//return symbol(sym.Then);}
	"else"    		{System.out.println(yytext() +"\t\t <ELSE>"); }//return symbol(sym.Else);}
	"elsif"   		{System.out.println(yytext() +"\t\t <ELSEIF>"); }//return symbol(sym.Else_If);}
	"return"  		{System.out.println(yytext() +"\t\t <RETURN>"); }//return symbol(sym.Return);}
	"function"    	{System.out.println(yytext() +"\t\t <FUNCTION>"); }//return symbol(sym.Function);}
	"for"     		{System.out.println(yytext() +"\t\t <FOR>"); }//return symbol(sym.For);}
	"loop"    		{System.out.println(yytext() +"\t\t <LOOP>"); }//return symbol(sym.Loop);}
	"put"         	{System.out.println(yytext() +"\t\t <PUT>"); }//return symbol(sym.Put);}
	"get"         	{System.out.println(yytext() +"\t\t <GET>"); }//return symbol(sym.Get);}
	"case"        	{System.out.println(yytext() +"\t\t <CASE>"); }//return symbol(sym.Case);}
	"when"        	{System.out.println(yytext() +"\t\t <WHEN>"); }//return symbol(sym.When);}
	"exit"        	{System.out.println(yytext() +"\t\t <EXIT>"); }//return symbol(sym.Exit);}
	"not"         	{System.out.println(yytext() +"\t\t <NOT>"); }//return symbol(sym.Not);}
	{colon}			{System.out.println(yytext() +"\t\t <COLON>"); }//return symbol(sym.COLON);}
	{comma}			{System.out.println(yytext() +"\t\t <COMMA>"); }//return symbol(sym.COMMA);}
	{semicolon}		{System.out.println(yytext() +"\t\t <SEMIC>"); }//return symbol(sym.SEMIC);}
	{identifier}	{System.out.println(yytext() +"\t\t <ID>"); }//return symbol(sym.ID);}
	{STRING}		{System.out.println(yytext() +"\t\t <STRING>"); }//return symbol(sym.STRING);}
	{NUMBER}		{System.out.println(yytext() +"\t\t <NUMBER>"); }//return symbol(sym.NUMBER);}
	{DECIMALS}		{System.out.println(yytext() +"\t\t <DECIMALS>"); }//return symbol(sym.DECIMALS);}


	// Operators
	{equal}			{System.out.println(yytext() +"\t\t <EQUAL>"); }//return symbol(sym.EQUAL);}
	{leftP}			{System.out.println(yytext() +"\t\t <LEFTP>"); }//return symbol(sym.LEFTP);}
	{rightP}		{System.out.println(yytext() +"\t\t <RIGHTP>"); }//return symbol(sym.RIGHTP);}
	{ASSIGN} 		{System.out.println(yytext() +"\t\t <ASSIGN OPERATOR>");  }//return symbol(sym.ASSIGN);}
	{LOGIC_OP} 		{System.out.println(yytext() +"\t\t <LOGIC OPERATOR>");  }//return symbol(sym.LOGIC_OP);}
    {ADD} 			{System.out.println(yytext() +"\t\t <ADDING OPERATOR>");  }//return symbol(sym.ADD);}
    {MULT} 			{System.out.println(yytext() +"\t\t <MULTIPLYING OPERATOR>");  }//return symbol(sym.MULT);}
	{RELATE} 		{System.out.println(yytext() +"\t\t <RELATIONAL OPERATOR>");  }//return symbol(sym.RELATE);}
    {space}         {}
	{new_line}		{}

}
<COMMENT> {
	{new_line}	 	{yybegin(YYINITIAL);}
	.				{}
}

[^] 
{ 
  String message = "";
  message  += ("\n****Invalid Character ==> "+yytext()+" <== ****");
  message  += ("\n On line " +(yyline + 1) + " and column "  + (yycolumn + 1));
  message  += ("\n************************************\n");
  String keyString = (yyline + 1) + (yycolumn + 1) + "";
  errors.put(keyString, yytext());
  System.err.println(message);
}