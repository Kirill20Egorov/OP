PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  SetOfDeCode = SET OF ' ' .. 'Z';
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  DeCode: Chiper;
  I: INTEGER;
  StrLength: 1 .. Len;
  SieveChars: SetOfDeCode;
  CorrectData: BOOLEAN;
  DeCipher: TEXT;
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  DeCode['1'] := ' ';
  DeCode['Z'] := 'A';
  DeCode['Y'] := 'B';
  DeCode['X'] := 'C';
  DeCode['#'] := 'D';
  DeCode['V'] := 'E';
  DeCode['U'] := 'F';
  DeCode['T'] := 'G';
  DeCode['S'] := 'H';
  DeCode['I'] := 'I';
  DeCode['Q'] := 'J';
  DeCode['P'] := 'K';
  DeCode['!'] := 'L';
  Decode['M'] := 'N';
  DeCode['N'] := 'M';
  DeCode['2'] := 'O';
  DeCode['K'] := 'P';
  DeCode['$'] := 'Q';
  DeCode['D'] := 'W';
  DeCode['H'] := 'S';
  DeCode['*'] := 'T';
  DeCode['F'] := 'U';
  DeCode['E'] := 'V';
  DeCode['D'] := 'R';
  DeCode['C'] := 'X';
  DeCode['B'] := 'Y';
  DeCode['A'] := 'Z'
END;  {Initialize}
PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN SieveChars
    THEN
      WRITE(DeCode[S[Index]]);
  WRITELN
END;  {Encode}
BEGIN {Encryption}
  {Инициализировать Code}
  SieveChars := ['A' .. 'Z'] + [' '];
  CorrectData := TRUE;
  ASSIGN(DeCipher, 'decipher.txt');
  RESET(DeCipher);
  Initialize(DeCode);
  WHILE NOT EOF(DeCipher)
  DO
    BEGIN
      {читать строку в  Msg и распечатать её}
      StrLength := 1;
      WHILE NOT EOLN(DeCipher) AND (StrLength < Len)
      DO
        BEGIN      
          READ(DeCipher, Msg[StrLength]); 
          IF Msg[StrLength] IN SieveChars
          THEN
            BEGIN
              WRITE(Msg[StrLength]);
              IF NOT EOLN(DeCipher)
              THEN
                StrLength := StrLength + 1
            END 
          ELSE
            BEGIN
              CorrectData := FALSE;
              WRITE('(Недопустимый символ: ', Msg[StrLength], ')') 
            END              
        END;
      WRITELN;
      IF CorrectData = TRUE
      THEN
        Encode(Msg)
      ELSE
        BEGIN
          WRITELN('Строка не будет зашифрована, был введен недопустимый символ');
          CorrectData := TRUE
        END;
      READLN(DeCipher)
    END
END.  {Encryption}

