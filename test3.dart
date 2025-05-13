void main(){
  int year = 79832;
  int century = 0;

  int temp = year + 99;
  century= temp ~/ 100;

  print(century);
}