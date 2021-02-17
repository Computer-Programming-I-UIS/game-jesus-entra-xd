boolean possible(int abajo, int derecha, int abajo1, int derecha1, int d, int r, boolean side, PImage[][] Tablero) {
  for (int i = derecha+ r, j  = abajo + d; i < 8 && j < 8 && i >= 0 && j >= 0; i+= r, j+= d) {
    if (side == BLANCO) {
      if (BLANCO(j, i, Tablero)) break;
      if (NEGRO(j, i, Tablero)) {
        if (i == derecha1 && j == abajo1)return true;
        break;
      }
    } else {
      if (NEGRO(j, i, Tablero)) break;
      if (BLANCO(j, i, Tablero)) {
        if (i == derecha1 && j == abajo1)return true;
        break;
      }
    }
    if (i == derecha1 && j == abajo1)return true;
  }
  return false;
}

boolean NEGRO (int abajo1, int derecha1, PImage[][] Tablero) {
  return (Tablero[abajo1][derecha1] == bReina || Tablero[abajo1][derecha1] == bCaballero  || Tablero[abajo1][derecha1] == bPeon || 
    Tablero[abajo1][derecha1] == bTorre || Tablero[abajo1][derecha1] == bAlfil || Tablero[abajo1][derecha1] == bRey);
}
boolean BLANCO (int abajo1, int derecha1, PImage[][] Tablero) {
  return (Tablero[abajo1][derecha1] == wReina || Tablero[abajo1][derecha1] == wCaballero  || Tablero[abajo1][derecha1] == wPeon || 
    Tablero[abajo1][derecha1] == wTorre || Tablero[abajo1][derecha1] == wAlfil || Tablero[abajo1][derecha1] == wRey);
}
boolean noNEGRO (int abajo1, int derecha1, PImage[][] Tablero) {
  return (BLANCO(abajo1, derecha1, Tablero) || Tablero[abajo1][derecha1] ==null);
}
boolean noBLANCO (int abajo1, int derecha1, PImage[][] Tablero) {
  return (NEGRO(abajo1, derecha1, Tablero) || Tablero[abajo1][derecha1] ==null);
}

boolean validMove(int abajo, int derecha, int abajo1, int derecha1, boolean side, PImage[][] Tablero) {
  if (side == BLANCO) {//BLANCO
    if (Tablero[abajo][derecha] == wPeon && !promote) {
      if (derecha1 == derecha&& abajo1 == abajo-1 && Tablero[abajo-1][derecha] == null) { // move forward 1
        return true;
      } else if (derecha1 == derecha&& abajo1 == abajo-2) {
        if (abajo == 6 && Tablero[abajo-1][derecha] == null && Tablero[abajo-2][derecha] == null) {
          return true;
        }
      }
      if (derecha!= 7) {//take
        if (NEGRO(abajo-1, derecha+1, Tablero)) {
          if (abajo1 == abajo-1 && derecha1 == derecha+1) return true;
        }
        if (abajo == 3 && Tablero[p01][p11] == bPeon && p01 == p0 + 2 && p1 == derecha+ 1) {//en passant
          if (abajo1 == abajo-1 && derecha1 == derecha+1) return true;
        }
      }
      if (derecha!= 0) {
        if (NEGRO(abajo-1, derecha-1, Tablero)) {
          if (abajo1 == abajo-1 && derecha1 == derecha-1) return true;
        }
        if (abajo == 3 && Tablero[p01][p11] == bPeon && p01 == p0 + 2 && p1 == derecha- 1) {//en passant
          if (abajo1 == abajo-1 && derecha1 == derecha- 1) return true;
        }
      }
    } else if (Tablero[abajo][derecha] == wRey) {
      if (abs(derecha- derecha1) <= 1 && abs(abajo - abajo1) <= 1) {//move
        if (noBLANCO(abajo1, derecha1, Tablero)) {
          return true;
        }
      }
      if (!wReyMoved && !check) {
        if (Tablero[7][3] == null && Tablero[7][2] == null && Tablero[7][1] == null &&
          abajo1 == 7 && derecha1 == 2 && wTorreMoved1 == false) {
          if (!incheck(abajo, derecha, 7, 3, turn)) {
            return true;
          }
        }
        if (Tablero[7][5] == null && Tablero[7][6] == null &&
          abajo1 == 7 && derecha1 == 6 && wTorreMoved2 == false) {
          if (!incheck(abajo, derecha, 7, 5, turn)) {
            return true;
          }
        }
      }
    } else if (Tablero[abajo][derecha] == wCaballero ) {
      if ((abs(abajo1 - abajo) == 2 && abs(derecha1 - derecha) == 1) ||
        (abs(abajo1 - abajo) == 1 && abs(derecha1 - derecha) == 2)) {
        if (noBLANCO(abajo1, derecha1, Tablero)) return true;
      }
    } else if (Tablero[abajo][derecha] == wAlfil) {      
      if (possible(abajo, derecha, abajo1, derecha1, 1, 1, BLANCO, Tablero)) return true;//inferior derecha
      if (possible(abajo, derecha, abajo1, derecha1, 1, -1, BLANCO, Tablero)) return true;//superior derecha
      if (possible(abajo, derecha, abajo1, derecha1, -1, 1, BLANCO, Tablero)) return true;//inferior izquierda
      if (possible(abajo, derecha, abajo1, derecha1, -1, -1, BLANCO, Tablero)) return true;//superior izquierda
    } else if (Tablero[abajo][derecha] == wTorre) {
      if (possible(abajo, derecha, abajo1, derecha1, 0, 1, BLANCO, Tablero)) return true;//derecha
      if (possible(abajo, derecha, abajo1, derecha1, 0, -1, BLANCO, Tablero)) return true;//izquierda
      if (possible(abajo, derecha, abajo1, derecha1, 1, 0, BLANCO, Tablero)) return true;//abajo
      if (possible(abajo, derecha, abajo1, derecha1, -1, 0, BLANCO, Tablero)) return true;//arriba
    } else if (Tablero[abajo][derecha] == wReina) {
      if (possible(abajo, derecha, abajo1, derecha1, 1, 1, BLANCO, Tablero)) return true;//inferior derecha
      if (possible(abajo, derecha, abajo1, derecha1, -1, 1, BLANCO, Tablero)) return true;//superior derecha
      if (possible(abajo, derecha, abajo1, derecha1, 1, -1, BLANCO, Tablero)) return true;//inferior izquierda
      if (possible(abajo, derecha, abajo1, derecha1, -1, -1, BLANCO, Tablero)) return true;//superior izquierda
      if (possible(abajo, derecha, abajo1, derecha1, 0, 1, BLANCO, Tablero)) return true;//derecha
      if (possible(abajo, derecha, abajo1, derecha1, 0, -1, BLANCO, Tablero)) return true;//izquierda
      if (possible(abajo, derecha, abajo1, derecha1, 1, 0, BLANCO, Tablero)) return true;//abajo
      if (possible(abajo, derecha, abajo1, derecha1, -1, 0, BLANCO, Tablero)) return true;//arriba
    }
  } else {
    if (Tablero[abajo][derecha] == bPeon && !promote) {
      if (derecha1 == derecha&& abajo1 == abajo+1 && Tablero[abajo+1][derecha] == null) { // move forward 1
        return true;
      } else if (derecha1 == derecha&& abajo1 == abajo+2) {
        if (abajo == 1 && Tablero[abajo+1][derecha] == null && Tablero[abajo+2][derecha] == null) {
          return true;
        }
      }
      if (derecha!= 7) {
        if (BLANCO(abajo1, derecha1, Tablero)) {
          if (abajo1 == abajo+1 && derecha1 == derecha+ 1) return true;
        }
        if (abajo == 4 && Tablero[p01][p11] == wPeon && p01 == p0 - 2 && p1 == derecha+ 1) {//en passant
          if (abajo1 == abajo+1 && derecha1 == derecha+ 1) return true;
        }
      }
      if (derecha!= 0) {
        if (BLANCO(abajo1, derecha1, Tablero)) {
          if (abajo1 == abajo+1 && derecha1 == derecha- 1) return true;
        }
        if (abajo == 4 && Tablero[p01][p11] == wPeon && p01 == p0 - 2 && p1 == derecha- 1) {//en pasant
          if (abajo1 == abajo+1 && derecha1 == derecha- 1) return true;
        }
      }
    } else if (Tablero[abajo][derecha] == bRey) {
      if (abs(derecha- derecha1) <= 1 && abs(abajo - abajo1) <= 1) {
        if (noNEGRO(abajo1, derecha1, Tablero)) {
          return true;
        }
      }
      if (!bReyMoved && !check) {
        if (Tablero[0][3] == null && Tablero[0][2] == null && Tablero[0][1] == null &&
          Tablero[0][0] == bTorre && abajo1 == 0 && derecha1 == 2) {
          if (!incheck(abajo, derecha, 0, 3, turn)) {
            return true;
          }
        }
        if (Tablero[0][5] == null && Tablero[0][6] == null &&
          Tablero[0][7] == bTorre && abajo1 == 0 && derecha1 == 6) {
          if (!incheck(abajo, derecha, 0, 5, turn)) {
            return true;
          }
        }
      }
    } else if (Tablero[abajo][derecha] == bCaballero ) {
      if ((abs(abajo1 - abajo) == 2 && abs(derecha1 - derecha) == 1) ||
        (abs(abajo1 - abajo) == 1 && abs(derecha1 - derecha) == 2)) {
        if (noNEGRO(abajo1, derecha1, Tablero)) return true;
      }
    } else if (Tablero[abajo][derecha] == bAlfil) {     
      if (possible(abajo, derecha, abajo1, derecha1, 1, 1, NEGRO, Tablero)) return true;//inferior derecha 
      if (possible(abajo, derecha, abajo1, derecha1, 1, -1, NEGRO, Tablero)) return true;//superior derecha
      if (possible(abajo, derecha, abajo1, derecha1, -1, 1, NEGRO, Tablero)) return true;//inferior izquierda
      if (possible(abajo, derecha, abajo1, derecha1, -1, -1, NEGRO, Tablero)) return true;//superior izquierda
    } else if (Tablero[abajo][derecha] == bTorre) {
      if (possible(abajo, derecha, abajo1, derecha1, 0, 1, NEGRO, Tablero)) return true;//derecha
      if (possible(abajo, derecha, abajo1, derecha1, 0, -1, NEGRO, Tablero)) return true;//izquierda
      if (possible(abajo, derecha, abajo1, derecha1, 1, 0, NEGRO, Tablero)) return true;//abajo
      if (possible(abajo, derecha, abajo1, derecha1, -1, 0, NEGRO, Tablero)) return true;//arriba
    } else if (Tablero[abajo][derecha] == bReina) {
      if (possible(abajo, derecha, abajo1, derecha1, 1, 1, NEGRO, Tablero)) return true;//inferior derecha
      if (possible(abajo, derecha, abajo1, derecha1, -1, 1, NEGRO, Tablero)) return true;// superior derecha 
      if (possible(abajo, derecha, abajo1, derecha1, 1, -1, NEGRO, Tablero)) return true;// inferior izquierda 
      if (possible(abajo, derecha, abajo1, derecha1, -1, -1, NEGRO, Tablero)) return true;//superior izquierda 
      if (possible(abajo, derecha, abajo1, derecha1, 0, 1, NEGRO, Tablero)) return true;//derecha
      if (possible(abajo, derecha, abajo1, derecha1, 0, -1, NEGRO, Tablero)) return true;//izquierda
      if (possible(abajo, derecha, abajo1, derecha1, 1, 0, NEGRO, Tablero)) return true;//abajo
      if (possible(abajo, derecha, abajo1, derecha1, -1, 0, NEGRO, Tablero)) return true;//arriba
    }
  }
  return false;
}

boolean incheck(int abajo, int derecha, int abajo1, int derecha1, boolean side) {
  PImage[][] updateTablero = new PImage[8][8];
  for (int i = 0; i<8; i++)
    for (int j = 0; j<8; j++) 
      updateTablero[i][j] = Tablero[i][j];
  updateTablero = movePiece(abajo, derecha, abajo1, derecha1, false, updateTablero);

  if (Check(side, updateTablero)) {
    return true;
  }
  return false;
}
boolean mate(boolean side) {//movimientos invalidos 
  for (int k = 0; k<8; k++) {
    for (int l = 0; l<8; l++) {
      if (side == BLANCO) {
        if (noBLANCO(l, k, Tablero))
          continue;
      } else if (noNEGRO(l, k, Tablero)) {
        continue;
      }
      for (int i = 0; i<8; i++) {
        for (int j = 0; j<8; j++) {
          if (validMove(l, k, i, j, side, Tablero) && !incheck(l, k, i, j, side)) return false;
        }
      }
    }
  }
  return true;
}
boolean Check(boolean side, PImage[][] Tablero) {
  int i, j = 0;
  boolean b = false;

  for (i = 0; i<8; i++) {
    for (j = 0; j<8; j++) {
      if (side == BLANCO) {
        if (Tablero[i][j] == wRey) { 
          b = true;
          break;
        }
      } else {
        if (Tablero[i][j] == bRey) { 
          b = true;
          break;
        }
      }
    }
    if (b == true) {
      break;
    }
  }
  for (int k = 0; k<8; k++) {
    for (int l = 0; l<8; l++) {
      if (side == BLANCO) {
        if (noNEGRO(l, k, Tablero))
          continue;
      } else if (noBLANCO(l, k, Tablero)) {
        continue;
      }
      if (validMove(l, k, i, j, !side, Tablero)) return true;
    }
  }
  return false;
}
