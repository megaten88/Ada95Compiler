package a95compiler;
import java_cup.runtime.*;
import java.util.ArrayList;


%%

%unicode
%cup
%class FlexLexer
%int
%line
%column
%ignorecase




%{

	private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    
    public static ArrayList<String> lexicalErrors = new ArrayList<String>();    
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
NUMBER = {digits}+
DECIMALS = {NUMBER}+{point}{NUMBER}+
identifier =  {letter}+({underscore}({letter}|{NUMBER})+)*({letter}|{NUMBER})*
STRING = "\""({letter}|{digits}|{space})*"\"" 


//Operators
ASSIGN = ":="
ADD = "+" | "-"
MULT = "*"|"/"|"mod"| "rem" 
RELATE = ">" | "<" | "==" | ">=" | "<=" | "/="
LOGIC_OP = "and"|"or"|"xor"|"xand"


//tipos
INTEGER = "Integer"
FLOAT = "Float"
BOOL = "true" | "false"
STRINGTYPE = "String"

%state COMMENT

%%


<YYINITIAL> {
	{comment}		{yybegin(COMMENT);}
	"procedure"   	{System.out.println(yytext() +"\t\t <PROCEDURE>");  return symbol(sym.PROCEDURE,yytext());}
	"begin"   		{System.out.println(yytext() +"\t\t <BEGIN>");  return symbol(sym.BEGIN,yytext());} 
	"end"     		{System.out.println(yytext() +"\t\t <END>");  return symbol(sym.END,yytext());}
	"in"      		{System.out.println(yytext() +"\t\t <IN>"); return symbol(sym.IN,yytext()); } 
	"out"     		{System.out.println(yytext() +"\t\t <OUT>");   return symbol(sym.OUT,yytext());}
	"in out"    	{System.out.println(yytext() +"\t\t <IN_OUT>");   return symbol(sym.IN_OUT,yytext());}
	"is"      		{System.out.println(yytext() +"\t\t <IS>");   return symbol(sym.IS,yytext());}
	"if"      		{System.out.println(yytext() +"\t\t <IF>");  return symbol(sym.IF,yytext());}
	"then"    		{System.out.println(yytext() +"\t\t <THEN>");  return symbol(sym.THEN,yytext());}
	"else"    		{System.out.println(yytext() +"\t\t <ELSE>");  return symbol(sym.ELSE,yytext());}
	"elsif"   		{System.out.println(yytext() +"\t\t <ELSEIF>");  return symbol(sym.ELIF,yytext());}
	"return"  		{System.out.println(yytext() +"\t\t <RETURN>");  return symbol(sym.RETURN,yytext());}
	"function"    	{System.out.println(yytext() +"\t\t <FUNCTION>");  return symbol(sym.FUNCTION,yytext());}
	"for"     		{System.out.println(yytext() +"\t\t <FOR>");  return symbol(sym.FOR,yytext());}
	"loop"    		{System.out.println(yytext() +"\t\t <LOOP>");  return symbol(sym.LOOP,yytext());}
	"put"         	{System.out.println(yytext() +"\t\t <PUT>");  return symbol(sym.PUT,yytext());}
	"get"         	{System.out.println(yytext() +"\t\t <GET>");  return symbol(sym.GET,yytext());}
	"case"        	{System.out.println(yytext() +"\t\t <CASE>");  return symbol(sym.CASE,yytext());}
	"when"        	{System.out.println(yytext() +"\t\t <WHEN>");  return symbol(sym.WHEN,yytext());}
	"exit"        	{System.out.println(yytext() +"\t\t <EXIT>");  return symbol(sym.EXIT,yytext());}
	"not"         	{System.out.println(yytext() +"\t\t <NOT>");  return symbol(sym.NOT,yytext());}
	"new_line"      {System.out.println(yytext() +"\t\t <NEW_LINE>");  return symbol(sym.NEW_LINE,yytext());}
	"null"			{System.out.println(yytext() +"\t\t <NULL>");  return symbol(sym.NULL,yytext());}
	{colon}			{System.out.println(yytext() +"\t\t <COLON>");  return symbol(sym.COLON,yytext());}
	{comma}			{System.out.println(yytext() +"\t\t <COMMA>");  return symbol(sym.COMMA,yytext());}
	{semicolon}		{System.out.println(yytext() +"\t\t <SEMIC>");  return symbol(sym.SEMIC,yytext());}
	{identifier}	{System.out.println(yytext() +"\t\t <ID>");  return symbol(sym.ID,yytext());}
	{STRING}		{System.out.println(yytext() +"\t\t <STRING>");  return symbol(sym.STRING,yytext());}
	{NUMBER}		{System.out.println(yytext() +"\t\t <NUMBER>");  return symbol(sym.NUMBER,yytext());}
	{DECIMALS}		{System.out.println(yytext() +"\t\t <DECIMALS>");  return symbol(sym.DECIMALS,yytext());}

	//tipo
	{INTEGER}		{System.out.println(yytext() +"\t\t <Int>");  return symbol(sym.INTEGER,yytext());}
	{FLOAT}			{System.out.println(yytext() +"\t\t <Int>");  return symbol(sym.FLOAT,yytext());}
	{BOOL}			{System.out.println(yytext() +"\t\t <Int>");  return symbol(sym.BOOL,yytext());}
	{STRINGTYPE}	{System.out.println(yytext() +"\t\t <STRING>");  return symbol(sym.STRINGTYPE,yytext());}

	// Operators
	{equal}			{System.out.println(yytext() +"\t\t <EQUAL>");  return symbol(sym.EQUAL,yytext());}
	{leftP}			{System.out.println(yytext() +"\t\t <LEFTP>");  return symbol(sym.LEFTP,yytext());}
	{rightP}		{System.out.println(yytext() +"\t\t <RIGHTP>");  return symbol(sym.RIGHTP,yytext());}
	{ASSIGN} 		{System.out.println(yytext() +"\t\t <ASSIGN OPERATOR>");   return symbol(sym.ASSIGN,yytext());}
	{LOGIC_OP} 		{System.out.println(yytext() +"\t\t <LOGIC OPERATOR>");   return symbol(sym.LOGIC_OP,yytext());}
    {ADD} 			{System.out.println(yytext() +"\t\t <ADDING OPERATOR>");   return symbol(sym.ADD,yytext());}
    {MULT} 			{System.out.println(yytext() +"\t\t <MULTIPLYING OPERATOR>");   return symbol(sym.MULT,yytext());}
	{RELATE} 		{System.out.println(yytext() +"\t\t <RELATIONAL OPERATOR>");   return symbol(sym.RELATE,yytext());}
    {space}         {}
	{new_line}		{}
	.				{System.out.println("Lex error: " + yytext() + "on line " + (yyline+1) + "and column " + (yycolumn+1)+".");
					lexicalErrors.add(("Lex error: " + yytext() + "on line " + (yyline+1) + "and column " + (yycolumn+1)+"."));
					}

}
<COMMENT> {
	{new_line}	 	{yybegin(YYINITIAL);}
	.				{}
}