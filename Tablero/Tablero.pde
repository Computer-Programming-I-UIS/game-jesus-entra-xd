size(600,600);
for(int R=0 ; R<8 ; R++){
for(int A=0 ; A<8 ; A++){
if( (R+A)%2 == 0){
fill(255, 0, 0);
}else{
fill (255, 255, 0);
}
rect( R * 75, A * 75, 75, 75);
}
}
