void boton(float x,float y,int colores,int func){
  String texto="a";
  if(func ==1){
    textSize(30);
    texto = "Jugar";
    botonclick(x,y,1);
  }else if(func == 0){
    texto = "Salir";
    botonclick(x,y,0);
  }else if(func == 2){
    texto = "Creditos";
    botonclick(x,y,2);}
 
  fill(colores);
  rect(x,y,140,40);
  fill(0);
  text(texto,x+60,y+30);
  
}

void menu(){
  background(#0700FF);
  boton(250,150,#FAD919,1);//Boton jugar
  boton(250,300,#FAD919,0);//Boton Salir
  boton(250,450,#FAD919,2);//Boton Creditos
  
  
}
void botonclick(float x, float y,int func){
  if(func == 1){
  if(mouseX >x && mouseX<x+100 && mouseY > y && mouseY < y+40 && mousePressed && mouseButton == LEFT){
    game = 1;
  }
  }else if(func == 0){
    if(mouseX >x && mouseX<x+100 && mouseY > y && mouseY < y+40 && mousePressed && mouseButton == LEFT){
    exit();}
  }else if(func == 2){
    if(mouseX >x && mouseX<x+100 && mouseY > y && mouseY < y+40 && mousePressed && mouseButton == LEFT){
    game = 2;
  }
}

}
