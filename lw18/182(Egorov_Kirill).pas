PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
CONST
  MaxScore = 100;
  MinScore = 0;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER; 
  Ch: CHAR;
  SurName: TEXT;  
PROCEDURE ProcessingFamily(VAR Res, Des: TEXT);
VAR
  Ch: CHAR;
BEGIN    
  WHILE (Ch <> ' ')
  DO
    BEGIN
      READ(Res, Ch); 
      WRITE(Des, Ch)
    END
END;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  WRITELN('Write surname and results due to probels between them');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;  
      REWRITE(SurName);
      IF NOT EOLN (INPUT)
      THEN
        ProcessingFamily(INPUT, SurName);
      WRITELN(SurName, ' ');
      RESET(SurName);   
      WHILE (WhichScore <= NumberOfScores) AND (NOT EOLN)
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore < MinScore) OR (NextScore > MaxScore)
          THEN
            WRITELN('Uncorrected data: ', NextScore, ' write another mark instead this')
          ELSE
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
        END;
      READLN;
      ProcessingFamily(SurName, OUTPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores; 
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize *NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}

