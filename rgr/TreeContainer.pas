UNIT TreeContainer;

INTERFACE
  USES Reader;
  
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Word: STRING;
               NumberWord: INTEGER;
               LLink, RLink: Tree
             END;
  PROCEDURE Insert(VAR Ptr: Tree; VAR Word: STRING);
  PROCEDURE PrintTree(VAR FOut: TEXT; VAR Ptr: Tree);
  PROCEDURE ClearTree(VAR Ptr: Tree);
  
IMPLEMENTATION
VAR
  Root: Tree;
PROCEDURE Insert(VAR Ptr: Tree; Word: STRING);
BEGIN {Insert}
  IF IsFoundWord(Word)
  THEN
    IF (Ptr = NIL) 
    THEN
      BEGIN 
        NEW(Ptr);
        Ptr^.NumberWord := 1;
        Ptr^.Word := Word;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Ptr^.Word > Word
      THEN
        Insert(Ptr^.LLink, Word)
      ELSE
        IF Ptr^.Word = Word
        THEN
          Ptr^.NumberWord := Ptr^.NumberWord + 1
        ELSE
          Insert(Ptr^.RLink, Word)
END;  {Insert}

PROCEDURE PrintTree(VAR FOut: TEXT; VAR Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN 
    BEGIN
      PrintTree(FOut, Ptr^.LLink);
      WRITELN(FOut, Ptr^.Word, ' ', Ptr^.NumberWord);
      PrintTree(FOut, Ptr^.RLink)
    END
END;  {PrintTree}

PROCEDURE ClearTree(VAR Ptr: Tree);
BEGIN
  IF Ptr <> NIL
  THEN 
    BEGIN
      ClearTree(Ptr^.LLink);
      ClearTree(Ptr^.RLink);
      DISPOSE(Ptr);
      Ptr := NIL
    END
END;

BEGIN {TreeSort}

END.  {TreeSort}
