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
      if (x == 0) Tablero[abajo1][derecha1] = wReina;
      if (x == 1) Tablero[abajo1][derecha1] = wTorre;
      if (x == 2) Tablero[abajo1][derecha1] = wAlfil;
      if (x == 3) Tablero[abajo1][derecha1] = wCaballero ;
    } else {
      if (x == 0) Tablero[abajo1][derecha1] = bReina;
      if (x == 1) Tablero[abajo1][derecha1] = bTorre;
      if (x == 2) Tablero[abajo1][derecha1] = bAlfil;
      if (x == 3) Tablero[abajo1][derecha1] = bCaballero ;
    }
    promote = false;
    check = false;
    if (Check(turn, Tablero)) {// cuando el rey esta bajo ataque 
      check = true;
    }
    if (mate(turn)) {// esto es para movimientos ilegales del ajedrez clasico
      gameOver = true;
    }
  } else if (click) {
    abajo1 = round(mouseY / (height/8)-0.5);
    derecha1 = round(mouseX / (width/8)-0.5);
    if (validMove(abajo, derecha, abajo1, derecha1, turn, Tablero) && !incheck(abajo, derecha, abajo1, derecha1, turn)) {
      check = false;
      Tablero = movePiece(abajo, derecha, abajo1, derecha1, true, Tablero);//movimiento de pieza 
      click = false;
    } else {//cambio de pieza
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
  if (Tablero[i0][j0] == wPeon) {
    if (i1 == 0) {
      if (update) promote = true;
    } else if (i1 == 2 && abs(j1 - j0) == 1 && Tablero[i1][j1] == null) {
      Tablero[i1 + 1][j1] = null;
    }
  } else if (Tablero[i0][j0] == bPeon) {//promocion peon NEGRO
    if (i1 == 7) {
      if (update) promote = true;
    } else if (i1 == 5 && abs(j1 - j0) == 1 && Tablero[i1][j1] == null) {
      Tablero[i1 - 1][j1] = null;
    }
  } else if (Tablero[i0][j0] == wRey) {
    if (wReyMoved == false && j1 == 2) {
      Tablero[7][0] = null;
      Tablero[7][3] = wTorre;
    }
    if (wReyMoved == false && j1 == 6) {
      Tablero[7][7] = null;
      Tablero[7][5] = wTorre;
    }
    if (update)wReyMoved = true;
  } else if (Tablero[i0][j0] == bRey) {
    if (bReyMoved == false && j1 == 2) {
      Tablero[0][0] = null;
      Tablero[0][3] = bTorre;
    }
    if (bReyMoved == false && j1 == 6) {
      Tablero[0][7] = null;
      Tablero[0][5] = bTorre;
    }
    if (update)bReyMoved = true;
  } else if (Tablero[i0][j0] == wTorre) {
    if (update) {
      if (!wTorreMoved1 && j0 == 0) wTorreMoved1 = true;
      if (!wTorreMoved2 && j0 == 7) wTorreMoved2 = true;
    }
  } else if (Tablero[i0][j0] == bTorre) {
    if (update) {
      if (!bTorreMoved1 && j0 == 0) bTorreMoved1 = true;
      if (!bTorreMoved2 && j0 == 7) bTorreMoved2 = true;
    }
  }
  Tablero[i1][j1] = Tablero[i0][j0];//mover pieza
  Tablero[i0][j0] = null;//remover pieza original 

  if (update) {
    if (Check(!turn, Tablero)) {//Rey en Jake
      check = true;
    }
    if (mate(!turn)) {//sin movimientos legales 
      gameOver = true;
    }
    turn = !turn;
  }
  return Tablero;
}
