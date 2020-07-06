UNIT Reader;

INTERFACE

FUNCTION ReadWord(VAR FIn: TEXT): STRING;
FUNCTION IsFoundWord(VAR Word: STRING): BOOLEAN;
  
IMPLEMENTATION
   
CONST
  AllowedSymbols = ['A' .. 'Z'] + ['a' .. 'z'] + ['À' .. 'ß'] + ['à' .. 'ÿ'];
  Upper = ['A' .. 'Z'] + ['À' .. 'ß'];
  
PROCEDURE GetLower(VAR Ch: CHAR);
BEGIN
  IF Ch IN Upper
  THEN
    Ch := chr(ord(Ch) + 32)
END;

FUNCTION IsFoundWord(VAR Word: STRING): BOOLEAN;
BEGIN
  IsFoundWord := Word <> ''
END;

FUNCTION ReadWord(VAR FIn: TEXT): STRING;
VAR
  Ch: CHAR;   
  Word: STRING;
BEGIN
  Word := '';     
  IF (NOT EOF(FIn)) 
  THEN
    READ(FIn, Ch);
  GetLower(Ch);
  IF Ch IN AllowedSymbols
  THEN
    Word := Word + Ch; 
  WHILE(NOT EOLN(FIn)) AND (Ch IN AllowedSymbols)
  DO
    BEGIN     
      READ(FIn, Ch);
      GetLower(Ch); 
      IF Ch IN AllowedSymbols
      THEN    
        Word := Word + Ch                  
    END;     
  ReadWord := Word
END;  

BEGIN
   
END.
