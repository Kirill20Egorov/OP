PROGRAM Print(INPUT, OUTPUT);
CONST
  MinPosition = 1;
  MaxPosition = 25;
  LineSize = 5;
  SymbolForPrint = 'X';
  SymbolSpace = ' ';
  SymbolA = [3, 7, 9, 11, 12, 13, 14, 15, 16, 20];
  SymbolC = [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
  SymbolE = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25]; 
  SymbolF = [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
  SymbolH = [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
  SymbolI = [3, 8, 13, 18, 23];
  SymbolL = [2, 7, 12, 17, 22, 23, 24];
  SymbolM = [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  SymbolN = [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];  
  SymbolO = [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
  SymbolP = [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 21]; 
  SymbolS = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
  SymbolT = [1, 2, 3, 4, 5, 8, 13, 18, 23];
  SymbolU = [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
  SymbolY = [1, 5, 7, 9, 13, 18, 23];
  SymbolZ = [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
TYPE
  Sieve = SET OF MinPosition..MaxPosition;
VAR
  Ch: CHAR;
  CorrectSymbol: BOOLEAN;
PROCEDURE PrintSymbol(CombinationOfSymbol: Sieve; VAR CorrectSymbol: BOOLEAN);
VAR
  Count: INTEGER;
BEGIN
  IF CorrectSymbol = TRUE
  THEN
    FOR Count := MinPosition TO MaxPosition
    DO
      BEGIN         
        IF Count IN CombinationOfSymbol
        THEN
          WRITE(SymbolForPrint)
        ELSE
          WRITE(SymbolSpace);
        IF (Count MOD LineSize = 0)
        THEN
          WRITELN
      END
END;
FUNCTION FindSymbol(Ch: CHAR; VAR CorrectSymbol: BOOLEAN): Sieve;
BEGIN
  CorrectSymbol := TRUE;
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch);   
  CASE Ch OF
    'A': FindSymbol := SymbolA; 
    'C': FindSymbol := SymbolC;
    'E': FindSymbol := SymbolE;
    'F': FindSymbol := SymbolF;
    'H': FindSymbol := SymbolH;
    'I': FindSymbol := SymbolI;
    'L': FindSymbol := SymbolL;  
    'M': FindSymbol := SymbolM;    
    'N': FindSymbol := SymbolN;
    'O': FindSymbol := SymbolO;  
    'P': FindSymbol := SymbolP;
    'S': FindSymbol := SymbolS;
    'T': FindSymbol := SymbolT;
    'U': FindSymbol := SymbolU;
    'Y': FindSymbol := SymbolY;
    'Z': FindSymbol := SymbolZ               
    ELSE 
      BEGIN
        WRITELN('COULDN''T FIND CHARACTER');
        CorrectSymbol := FALSE
      END 
  END
END;
BEGIN
  WRITELN('WRITE ONLY ONE OF THE FOLLOWING UPPERCASE CHARACTER: A, C, E, F, H, I, L, M, N, O, P, S, T, U, Y, Z'); 
  PrintSymbol(FindSymbol(Ch, CorrectSymbol), CorrectSymbol)
END.
