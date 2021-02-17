void creditos(){
  background(#FF3F2F);
  String[] biblia = loadStrings("data/creditos.txt");
  for(int i=0;i<biblia.length;i++){
    textSize(20);
    text(biblia[i],290,20+20*i);
    }
    }
