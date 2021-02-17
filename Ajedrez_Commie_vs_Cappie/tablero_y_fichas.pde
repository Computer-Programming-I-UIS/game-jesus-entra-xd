void mostrarTablero() {
  for (int i = 0; i<8; i++)
    for (int j = 0; j<8; j++) { 
      if ((i+j)%2 == 0) fill(#e1ff59);
      else fill(#cc3c37);
      rect(i*width/8, j*height/8, width/8, height/8);
      if (Tablero[j][i] != null) image(Tablero[j][i], i*width/8, j*height/8);
      if (click) {
        if (validMove(abajo, derecha, j, i, turn, Tablero) && !incheck(abajo, derecha, j, i, turn)) {
          fill(0, 255, 0, 100);
          rect(i*width/8, j*height/8, width/8, height/8);
        }
        if (j == abajo && i == derecha&& Tablero[j][i] != null) {
          fill(0, 0, 255, 100);
          rect(i*width/8, j*height/8, width/8, height/8);
        }
      }
    }
  if (check && !gameOver && !promote) {
    fill(255, 0, 0);
    text("JAKE", 0, height/2, width, height);
  }
  if (promote && !gameOver) {
    stroke(2);
    fill(0, 100);
    rect(0, 0, 2*width/8, height);
    rect(2*width/8, 0, 2*width/8, height);
    rect(4*width/8, 0, 2*width/8, height);
    rect(6*width/8, 0, 2*width/8, height);
    if (!turn) {
      image(wQueen, 0.5*width/8, 3.5*height/8);
      image(wRook, 2.5*width/8, 3.5*height/8);
      image(wBishop, 4.5*width/8, 3.5*height/8);
      image(wKnight, 6.5*width/8, 3.5*height/8);
    } else {
      image(bQueen, 0.5*width/8, 3.5*height/8);
      image(bRook, 2.5*width/8, 3.5*height/8);
      image(bBishop, 4.5*width/8, 3.5*height/8);
      image(bKnight, 6.5*width/8, 3.5*height/8);
    }
    noStroke();
  }
}


void PosInicial() {
  Tablero = new PImage[8][8];

  Tablero[0][0] = bRook;
  Tablero[0][1] = bKnight;
  Tablero[0][2] = bBishop;
  Tablero[0][3] = bQueen;
  Tablero[0][4] = bKing;
  Tablero[0][5] = bBishop;
  Tablero[0][6] = bKnight;
  Tablero[0][7] = bRook;
  Tablero[1][0] = bPawn;
  Tablero[1][1] = bPawn;
  Tablero[1][2] = bPawn; 
  Tablero[1][3] = bPawn;
  Tablero[1][4] = bPawn;
  Tablero[1][5] = bPawn;
  Tablero[1][6] = bPawn;
  Tablero[1][7] = bPawn;

  Tablero[7][0] = wRook;
  Tablero[7][1] = wKnight;
  Tablero[7][2] = wBishop;
  Tablero[7][3] = wQueen;
  Tablero[7][4] = wKing;
  Tablero[7][5] = wBishop;
  Tablero[7][6] = wKnight;
  Tablero[7][7] = wRook;
  Tablero[6][0] = wPawn;
  Tablero[6][1] = wPawn;
  Tablero[6][2] = wPawn;
  Tablero[6][3] = wPawn;
  Tablero[6][4] = wPawn;
  Tablero[6][5] = wPawn;
  Tablero[6][6] = wPawn;
  Tablero[6][7] = wPawn;

  
  abajo=derecha=abajo1=derecha1=-1;
  p0=p1=p01=p11=-1;
  click = false;
  turn = BLANCO;
  gameOver = false;
  wKingMoved = false;
  bKingMoved = false;
  wRookMoved1 = false;
  bRookMoved1 = false;
  wRookMoved2 = false;
  bRookMoved2 = false;
  check = false;
  promote = false;
}
