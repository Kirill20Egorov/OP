PROGRAM Print(INPUT, OUTPUT);
CONST
  MinPosition = 1;
  MaxPosition = 25;
  LineSize = 5;
  SymbolForPrint = 'X';
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
PROCEDURE PrintSymbol(CombinationOfSymbol: Sieve);
VAR
  Count: INTEGER;
BEGIN
  FOR Count := MinPosition TO MaxPosition
  DO
    BEGIN         
      IF Count IN CombinationOfSymbol
      THEN
        WRITE(SymbolForPrint)
      ELSE
        WRITE(' ');
      IF (Count MOD LineSize = 0)
      THEN
        WRITELN
    END
END;
PROCEDURE FindSymbol(VAR Ch: CHAR);
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch);   
  CASE Ch OF
    'A': PrintSymbol(SymbolA);
    'C': PrintSymbol(SymbolC);
    'E': PrintSymbol(SymbolE);
    'F': PrintSymbol(SymbolF);
    'H': PrintSymbol(SymbolH);
    'I': PrintSymbol(SymbolI);
    'L': PrintSymbol(SymbolL);  
    'M': PrintSymbol(SymbolM);    
    'N': PrintSymbol(SymbolN);
    'O': PrintSymbol(SymbolO);  
    'P': PrintSymbol(SymbolP);
    'S': PrintSymbol(SymbolS);
    'T': PrintSymbol(SymbolT);
    'U': PrintSymbol(SymbolU);
    'Y': PrintSymbol(SymbolY);
    'Z': PrintSymbol(SymbolZ)                 
    ELSE WRITELN('COULDN''T FIND CHARACTER') 
  END
END;
BEGIN
  WRITELN('WRITE ONLY ONE OF THE FOLLOWING UPPERCASE CHARACTER: A, C, E, F, H, I, L, M, N, O, P, S, T, U, Y, Z'); 
  FindSymbol(Ch)
END.
