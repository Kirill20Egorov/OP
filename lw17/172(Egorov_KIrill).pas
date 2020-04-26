PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Ñ÷èòûâàåò òåêóùèé ñèìâîë èç ôàéëà, åñëè îí - öèôðà, âîçâðàùàåò åãî 
 ïðåîáðàçóÿ â çíà÷åíèå òèïà INTEGER. Åñëè ñ÷èòàííûé ñèìâîë íå öèôðà
 âîçâðàùàåò -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(F, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE    
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 ELSE  
  D := -1  
END; {ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{Ïðåîáðàçóåò ñòðîêó èç ôàéëà äî ïåðâîãî íåöèôðîâîãî ñèìâîëà, â ñîîòâåòñòâóþùåå 
 öåëîå ÷èñëî N}
VAR
  Digit: INTEGER;
  Check: BOOLEAN;
BEGIN {ReadNumber}
  Digit := 0;
  N := 0;
  Check := TRUE;
  WRITELN('MAXINT=', MAXINT);
  WHILE (Check) AND NOT(EOLN(INPUT))
  DO
    BEGIN
      ReadDigit(F, Digit);              
      IF Digit <> -1
      THEN
        BEGIN
          // Пояснение к условию:
          //(ЕСЛИ БЕЗ МЛДАШИХ РАЗРЯДОВ ВВЕДЕННОЕ ЧИСЛО БУДЕТ УЖЕ БОЛЬШЕ ЧЕМ MAXIT ) OR
          // ((ВСЕ РАЗРЯДЫ РАВНЫ) AND (МЛАДШИЙ РАЗРЯД ВВЕДЕННОГО ЧИСЛА БОЛЬШЕ ЧЕМ У MAXINT))
          IF  ((MAXINT DIV 10 < N) OR (((MAXINT DIV 10 = N) AND ((MAXINT MOD 10) < Digit))))
          THEN
            BEGIN
              Check := FALSE;
              N := -1;
              WRITELN('Error the number > MAXINT')
            END
          ELSE
            BEGIN      
              N := N * 10;
              N := N + Digit
            END;
        END
      ELSE
        Check := FALSE
    END
END; {ReadNumber}
BEGIN {TestReadNumber}
  ReadNumber(INPUT, Number);
  WRITELN(Number)
END.  {TestReadNumber}
