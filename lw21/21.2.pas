PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
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
  FOR Index := 1 TO I
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
  ASSIGN(cipher, 'cipher.txt');
  RESET(Cipher);
  Initialize(Code);
  WHILE NOT EOF(Cipher)
  DO
    BEGIN
      {читать строку в  Msg и распечатать её}
      I := 0;
      WHILE NOT EOLN(Cipher) AND (I < Len)
      DO
        BEGIN      
          I := I + 1;
          READ(Cipher, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;
      READLN(Cipher);
      WRITELN;
      Encode(Msg)
    END
END.  {Encryption}

