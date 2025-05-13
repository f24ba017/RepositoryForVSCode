void main(){
  List<int> kosuu = [521643,8456522,52385,253,78952654,158646,695879,3377789,99558484];
  List<int> ninzu = [52,1112,98,39,7855,2566,55,899,8655];
  List<int> remainder = [];
  int min_remainder = 0;
  int max_ninzu = 0;
  int idx = 0;

  for(int i = 0; i < kosuu.length; i++){
    int temp = kosuu[i] % ninzu[i];
    remainder.add(temp);
    if(min_remainder == 0 || temp < min_remainder){
      min_remainder = temp;
    }
  }

  for(int j = 0; j < remainder.length; j++){
    if(remainder[j] == min_remainder){
      if(max_ninzu == 0 || ninzu[j] > max_ninzu){
        max_ninzu = ninzu[j];
        idx = j;
      }
    }
  }

  print("${kosuu[idx]} ${ninzu[idx]}");

  print(remainder);
}