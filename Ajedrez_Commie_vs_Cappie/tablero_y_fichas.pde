void mostrarTablero() {
  for (int i = 0; i<8; i++)
    for (int j = 0; j<8; j++) { 
      if ((i+j)%2 == 0) fill(#e1ff59);
      else fill(#cc3c37);
      rect(i*width/8, j*height/8, width/8, height/8);//Tablero
      if (Tablero[j][i] != null) image(Tablero[j][i], i*width/8, j*height/8);//pieza
      if (click) {
        if (validMove(abajo, derecha, j, i, turn, Tablero) && !incheck(abajo, derecha, j, i, turn)) {
          fill(0, 255, 0, 100);//Movimientos posibles en verde
          rect(i*width/8, j*height/8, width/8, height/8);
        }
        if (j == abajo && i == derecha&& Tablero[j][i] != null) {
          fill(0, 0, 255, 100);//pieza actual en azul
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
      image(wReina, 0.5*width/8, 3.5*height/8);
      image(wTorre, 2.5*width/8, 3.5*height/8);
      image(wAlfil, 4.5*width/8, 3.5*height/8);
      image(wCaballero , 6.5*width/8, 3.5*height/8);
    } else {
      image(bReina, 0.5*width/8, 3.5*height/8);
      image(bTorre, 2.5*width/8, 3.5*height/8);
      image(bAlfil, 4.5*width/8, 3.5*height/8);
      image(bCaballero , 6.5*width/8, 3.5*height/8);
    }
    noStroke();
  }
}


void PosInicial() {
  Tablero = new PImage[8][8];

  Tablero[0][0] = bTorre;
  Tablero[0][1] = bCaballero ;
  Tablero[0][2] = bAlfil;
  Tablero[0][3] = bReina;
  Tablero[0][4] = bRey;
  Tablero[0][5] = bAlfil;
  Tablero[0][6] = bCaballero ;
  Tablero[0][7] = bTorre;
  Tablero[1][0] = bPeon;
  Tablero[1][1] = bPeon;
  Tablero[1][2] = bPeon; 
  Tablero[1][3] = bPeon;
  Tablero[1][4] = bPeon;
  Tablero[1][5] = bPeon;
  Tablero[1][6] = bPeon;
  Tablero[1][7] = bPeon;

  Tablero[7][0] = wTorre;
  Tablero[7][1] = wCaballero ;
  Tablero[7][2] = wAlfil;
  Tablero[7][3] = wReina;
  Tablero[7][4] = wRey;
  Tablero[7][5] = wAlfil;
  Tablero[7][6] = wCaballero ;
  Tablero[7][7] = wTorre;
  Tablero[6][0] = wPeon;
  Tablero[6][1] = wPeon;
  Tablero[6][2] = wPeon;
  Tablero[6][3] = wPeon;
  Tablero[6][4] = wPeon;
  Tablero[6][5] = wPeon;
  Tablero[6][6] = wPeon;
  Tablero[6][7] = wPeon;

  //Variables globales
  abajo=derecha=abajo1=derecha1=-1;
  p0=p1=p01=p11=-1;
  click = false;
  turn = BLANCO;
  gameOver = false;
  wReyMoved = false;
  bReyMoved = false;
  wTorreMoved1 = false;
  bTorreMoved1 = false;
  wTorreMoved2 = false;
  bTorreMoved2 = false;
  check = false;
  promote = false;
}
