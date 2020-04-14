PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  Sieve, DeletingSieve: SET OF 2..Max;
  PrimeNumber: INTEGER;
PROCEDURE FindMultipartNumbers;
VAR
  Number: INTEGER;
BEGIN
  Number := PrimeNumber;
  WRITE('Prime number: ', Number, ' Delete from Sieve: ');
  WHILE Number <= Max
  DO
    BEGIN
      IF (Number MOD PrimeNumber = 0) AND (Number IN Sieve)
      THEN
        BEGIN
          DeletingSieve := DeletingSieve + [Number];
          WRITE(Number, ' ')
        END;   
      Number := Number + 1
    END  
END;  
PROCEDURE FindNewPrime(VAR Prime: INTEGER);
VAR
  Curr: INTEGER;  
BEGIN
  Curr := 0;  
  WHILE (Prime = 0) AND (Curr <= Max)
  DO
    BEGIN
      IF Curr IN Sieve
      THEN
        Prime := Curr
      ELSE
        Curr := Curr +  1
    END
END;      
BEGIN
  Sieve := [2..Max];
  DeletingSieve := [];
  PrimeNumber := 2;
  WHILE Sieve <> []
  DO
    BEGIN   
      FindMultipartNumbers;  
      Sieve := Sieve - DeletingSieve;  
      PrimeNumber := 0;   
      FindNewPrime(PrimeNumber);
      WRITELN
    END
END.

