
int abajo, derecha, abajo1, derecha1;
int p0, p1, p01, p11, game=0;
boolean click;
boolean BLANCO = true;
boolean NEGRO = false;
boolean turn;
boolean gameOver;
boolean wKingMoved, bKingMoved, wRookMoved1, bRookMoved1, wRookMoved2, bRookMoved2;
boolean check;
boolean promote;
PImage wKing, bKing, wQueen, bQueen, wPawn, bPawn, wRook, bRook, wKnight, bKnight, wBishop, bBishop;
PImage[][] Tablero;

void setup() {
  surface.setTitle("Ajedrez Comunismo vs Capitalismo");
  size(640, 640);
  noStroke();
  textSize(width/8);
  textAlign(CENTER);

  loadfichas();

  PosInicial();
}
void draw() {
  if(game==1){
  mostrarTablero();
  if (gameOver) {
    fill(255, 0, 0);
    if (check) text("JAKE MATE", 0, height/2, width, height);
    else text("STALEMATE", 0, height/2, width, height);
  }
  }else if(game==0){
   menu();
  }else if(game==2){
   creditos(); 
  }
}
