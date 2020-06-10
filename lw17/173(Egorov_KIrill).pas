PROGRAM Stat(INPUT, OUTPUT);
VAR
  Count, Number, Min, Max, Sum, Ave: INTEGER;
  Check: BOOLEAN; 
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Считывает текущий символ из файла, если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := 0;
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
{ГЏГ°ГҐГ®ГЎГ°Г Г§ГіГҐГІ Г±ГІГ°Г®ГЄГі ГЁГ§ ГґГ Г©Г«Г  Г¤Г® ГЇГҐГ°ГўГ®ГЈГ® Г­ГҐГ¶ГЁГґГ°Г®ГўГ®ГЈГ® Г±ГЁГ¬ГўГ®Г«Г , Гў Г±Г®Г®ГІГўГҐГІГ±ГІГўГіГѕГ№ГҐГҐ 
 Г¶ГҐГ«Г®ГҐ Г·ГЁГ±Г«Г® N}
VAR
  Digit: INTEGER;
  Check: BOOLEAN;
BEGIN {ReadNumber}
  Digit := 0;
  N := 0;
  Check := TRUE;
  WHILE (Check) AND NOT(EOLN(INPUT))
  DO
    BEGIN
      ReadDigit(F, Digit);              
      IF Digit <> -1
      THEN
        BEGIN
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
  Sum := 0;
  Number := 0;
  Count := 0;
  Min := MAXINT;
  Max := 0;
  Check := TRUE;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF  (MAXINT - Number < Sum)
      THEN
        WRITELN('Error the sum > MAXINT')
      ELSE
        BEGIN
          Sum := Sum + Number;
          IF Number > Max
          THEN
            Max := Number;
          IF Number < Min
          THEN
            Min := Number;
          IF NOT EOLN
          THEN
            BEGIN
              Check := TRUE;
              Number := 0
            END;
          Count := Count + 1
        END
    END;
  IF Count <> 0
  THEN
    BEGIN
      WRITELN('Введено чисел: ', Count);
      WRITELN('Сумма всех: ', Sum, ' Среднее арифм: ', Sum DIV Count, '.', Sum MOD Count * 100 DIV Count);
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max)
    END
END.  {TestReadNumber}
