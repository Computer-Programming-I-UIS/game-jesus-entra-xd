void keyPressed(){
 if(keyCode=='P' && game ==0){
   PosInicial();
   game=1;
   
 }else if(keyCode=='C' && game ==0){
   game=2;
 }else if(keyCode=='M' && game ==1 || game==2){
  game=0; 
 }
  
}

void mousePressed() {
  if (gameOver) PosInicial();
  if (promote) {
    int x = round(mouseX/ (width/4)-0.5);
    if (!turn == BLANCO) {
      if (x == 0) Tablero[abajo1][derecha1] = wQueen;
      if (x == 1) Tablero[abajo1][derecha1] = wRook;
      if (x == 2) Tablero[abajo1][derecha1] = wBishop;
      if (x == 3) Tablero[abajo1][derecha1] = wKnight;
    } else {
      if (x == 0) Tablero[abajo1][derecha1] = bQueen;
      if (x == 1) Tablero[abajo1][derecha1] = bRook;
      if (x == 2) Tablero[abajo1][derecha1] = bBishop;
      if (x == 3) Tablero[abajo1][derecha1] = bKnight;
    }
    promote = false;
    check = false;
    if (Check(turn, Tablero)) {
      check = true;
    }
    if (mate(turn)) {
      gameOver = true;
    }
  } else if (click) {
    abajo1 = round(mouseY / (height/8)-0.5);
    derecha1 = round(mouseX / (width/8)-0.5);
    if (validMove(abajo, derecha, abajo1, derecha1, turn, Tablero) && !incheck(abajo, derecha, abajo1, derecha1, turn)) {
      check = false;
      Tablero = movePiece(abajo, derecha, abajo1, derecha1, true, Tablero);
      click = false;
    } else {
      abajo = abajo1;
      derecha= derecha1;
      click = true;
    }
  } else {
    abajo = round(mouseY / (height/8)-0.5);
    derecha= round(mouseX / (width/8)-0.5);
    click = true;
  }
}


PImage[][] movePiece(int i0, int j0, int i1, int j1, boolean update, PImage[][] Tablero) {
  if (update) {
    p0 = i0; 
    p1 = j1; 
    p01 = i1; 
    p11 = j1;
  }
  if (Tablero[i0][j0] == wPawn) {
    if (i1 == 0) {
      if (update) promote = true;
    } else if (i1 == 2 && abs(j1 - j0) == 1 && Tablero[i1][j1] == null) {
      Tablero[i1 + 1][j1] = null;
    }
  } else if (Tablero[i0][j0] == bPawn) {
    if (i1 == 7) {
      if (update) promote = true;
    } else if (i1 == 5 && abs(j1 - j0) == 1 && Tablero[i1][j1] == null) {
      Tablero[i1 - 1][j1] = null;
    }
  } else if (Tablero[i0][j0] == wKing) {
    if (wKingMoved == false && j1 == 2) {
      Tablero[7][0] = null;
      Tablero[7][3] = wRook;
    }
    if (wKingMoved == false && j1 == 6) {
      Tablero[7][7] = null;
      Tablero[7][5] = wRook;
    }
    if (update)wKingMoved = true;
  } else if (Tablero[i0][j0] == bKing) {
    if (bKingMoved == false && j1 == 2) {
      Tablero[0][0] = null;
      Tablero[0][3] = bRook;
    }
    if (bKingMoved == false && j1 == 6) {
      Tablero[0][7] = null;
      Tablero[0][5] = bRook;
    }
    if (update)bKingMoved = true;
  } else if (Tablero[i0][j0] == wRook) {
    if (update) {
      if (!wRookMoved1 && j0 == 0) wRookMoved1 = true;
      if (!wRookMoved2 && j0 == 7) wRookMoved2 = true;
    }
  } else if (Tablero[i0][j0] == bRook) {
    if (update) {
      if (!bRookMoved1 && j0 == 0) bRookMoved1 = true;
      if (!bRookMoved2 && j0 == 7) bRookMoved2 = true;
    }
  }
  Tablero[i1][j1] = Tablero[i0][j0];
  Tablero[i0][j0] = null;

  if (update) {
    if (Check(!turn, Tablero)) {
      check = true;
    }
    if (mate(!turn)) {
      gameOver = true;
    }
    turn = !turn;
  }
  return Tablero;
}
