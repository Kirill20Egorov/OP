PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE 
  SubsetofInt = SET OF Min..Max;
VAR
  Sieve: SubsetofInt;
  PrimeNumber: INTEGER;
PROCEDURE FindMultipartNumbers(VAR Prime: INTEGER; VAR ResourceSieve: SubsetofInt);
VAR
  Number: INTEGER;
BEGIN
  Number := Prime;
  WRITE('Prime number: ', Number, ' Delete from Sieve: ');
  WHILE Number <= Max
  DO
    BEGIN
      IF (Number MOD Prime = 0) AND (Number IN Sieve)
      THEN
        BEGIN
          ResourceSieve := ResourceSieve - [Number];
          WRITE(Number, ' ')
        END;   
      Number := Number + 1
    END
END;  
PROCEDURE FindNextPrime(VAR Prime: INTEGER; VAR ResourceSieve: SubsetofInt);
VAR
  Curr: INTEGER;  
BEGIN
  Curr := 0;  
  Prime := 0;
  WHILE (Prime = 0) AND (Curr <= Max)
  DO
    BEGIN
      IF Curr IN ResourceSieve
      THEN
        Prime := Curr
      ELSE
        Curr := Curr +  1
    END
END;      
BEGIN
  Sieve := [Min..Max];
  PrimeNumber := Min;
  WHILE Sieve <> []
  DO
    BEGIN   
      FindMultipartNumbers(PrimeNumber, Sieve);   
      FindNextPrime(PrimeNumber, Sieve);
      WRITELN
    END
END.
