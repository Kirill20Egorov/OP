PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  SetOfCode = SET OF ' ' .. 'Z';
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  SieveChars: SetOfCode;
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  StrLength: 1 .. Len;
  CorrectData: BOOLEAN;
  Cipher: TEXT;
PROCEDURE Initialize(VAR Cipher: TEXT; VAR Code: Chiper; VAR SieveChars: SetOfCode);
VAR 
  Check: BOOLEAN;      
  Ch, ChCode: CHAR;
{Присвоить Code шифр замены}
BEGIN {Initialize} 
  Check := TRUE; 
  WHILE NOT EOF(Cipher) AND Check
  DO
    BEGIN
      READ(Cipher, ChCode);
      IF ChCode IN SieveChars
      THEN
        BEGIN 
          READ(Cipher, Ch);
          IF Ch IN SieveChars
          THEN
            Code[ChCode] := Ch
          ELSE
            Check := FALSE
        END
      ELSE
        Check := FALSE;
      READLN(Cipher)   
    END
END;  {Initialize}
PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN SieveChars
    THEN
      WRITE(Code[S[Index]]);
  WRITELN
END;  {Encode}
BEGIN {Encryption}
  {Инициализировать Code}
  CorrectData := TRUE;
  SieveChars := [' ' .. 'Z']; 
  ASSIGN(cipher, 'cipher.txt');
  RESET(Cipher);    
  Initialize(Cipher, Code, SieveChars);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {читать строку в  Msg и распечатать её}
      StrLength := 1;
      WHILE NOT EOLN(INPUT) AND (StrLength < Len)
      DO
        BEGIN      
          READ(INPUT, Msg[StrLength]); 
          IF Msg[StrLength] IN SieveChars
          THEN
            BEGIN
              WRITE(Msg[StrLength]);
              IF NOT EOLN(INPUT)
              THEN
                StrLength := StrLength + 1
            END 
          ELSE                               
            BEGIN
              WRITE('(Недопустимый символ: ', Msg[StrLength], ')');
              CorrectData := FALSE
            END               
        END;
      WRITELN;
      IF CorrectData = TRUE
      THEN
        Encode(Msg)
      ELSE
        BEGIN
          WRITELN('Данная строка не будет зашифрована. Был введен недопустимый символ');
          CorrectData := TRUE
        END;
      READLN(INPUT)
    END
END.  {Encryption}

