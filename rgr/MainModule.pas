UNIT MainModule;
INTERFACE
  USES Reader, TreeContainer;
  PROCEDURE GetStats();
IMPLEMENTATION
VAR
  FIn, FOut: TEXT;
  Word: STRING; 
  Root: Tree;
PROCEDURE GetStats();
BEGIN
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      Word := ReadWord(FIn);
      Insert(Root, Word)
    END;
  PrintTree(FOut, Root);
  RESET(FOut);          
  ClearTree(Root)
END;
BEGIN
  ASSIGN(FIn, 'fin.txt');
  ASSIGN(FOut, 'fout.txt');
  REWRITE(FOut);
  RESET(FIn)
END.
