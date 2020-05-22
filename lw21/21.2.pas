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
  Cipher: TEXT;
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code[' '] := '1';
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A'
END;  {Initialize}
PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
BEGIN {Encryption}
  {Инициализировать Code}
  SieveChars := ['A' .. 'Z'] + [' '];
  ASSIGN(cipher, 'cipher.txt');
  RESET(Cipher);
  Initialize(Code);
  WHILE NOT EOF(Cipher)
  DO
    BEGIN
      {читать строку в  Msg и распечатать её}
      StrLength := 1;
      WHILE NOT EOLN(Cipher) AND (StrLength < Len)
      DO
        BEGIN      
          READ(Cipher, Msg[StrLength]); 
          IF Msg[StrLength] IN SieveChars
          THEN
            BEGIN
              WRITE(Msg[StrLength]);
              IF NOT EOLN(Cipher)
              THEN
                StrLength := StrLength + 1
            END 
          ELSE
            WRITE('(Недопустимый символ: ', Msg[StrLength], ')')               
        END;
      IF StrLength < Len
      THEN
        FOR I := StrLength + 1 TO Len
        DO
          Msg[I] := '-';
      READLN(Cipher);
      WRITELN;
      Encode(Msg)
    END
END.  {Encryption}

