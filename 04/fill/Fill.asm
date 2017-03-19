// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@SCREEN
D=A
@cursor
M=D
@white
M=0
D=-1
@black
M=D
@RESET
0;JMP

(IO)
  @KBD
  D=M
  @SET_BLACK_THEN_DRAW
  D;JGT
  @SET_WHITE_THEN_DRAW
  0;JMP

(DRAW)
  @color
  D=M
  @cursor
  A=M
  M=D
  @cursor
  M=M+1 // increment cursor position

  // Check if we're past the limit
  @24576
  D=A
  @cursor
  D=D-M
  @RESET
  D;JLE // goto reset if we are
  @IO
  0;JMP // if not go to IO again


(SET_BLACK_THEN_DRAW)
  @black
  D=M
  @color
  M=D
  @DRAW
  0;JMP

(SET_WHITE_THEN_DRAW)
  @white
  D=M
  @color
  M=D
  @DRAW
  0;JMP

(RESET)
  @SCREEN
  D=A
  @cursor
  M=D
  @IO
  0;JMP

(END)
  @END
  0;JMP


