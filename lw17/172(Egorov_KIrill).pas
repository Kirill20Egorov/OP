PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Count, Number: INTEGER;
  Check: BOOLEAN;
CONST
  MaxInt = 32767;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF NOT EOLN(F)
  THEN
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
{Преобразует строку из файла до первого нецифрового символа, в соответствующее 
 целое число N}
VAR
  Digit: INTEGER;
BEGIN {ReadNumber}
  WHILE ((NOT EOLN(INPUT)) AND (Check))
  DO
    BEGIN
      ReadDigit(F, Digit);
      IF Digit <> -1
      THEN
        BEGIN
          N := N * 10;
          N := N + Digit;
          IF N > MaxInt
          THEN
            BEGIN
              Check := FALSE;
              N := -1;
              WRITELN('Error the number > MAXINT')
            END
        END
      ELSE
        Check := FALSE
    END
END; {ReadNumber}
BEGIN {TestReadNumber}
  Number := 0;
  Count := 0;
  Check := TRUE;
  ReadNumber(INPUT, Number);
  WRITELN(Number)
END.  {TestReadNumber}
