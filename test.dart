void main(){
  int start = 1101;
  int end = 19971101;
  int num = 0;

  for(int i = start; i <= end; i++){
    if(i % 2 == 0){
      num++;
    }
  }

  print(num);
}