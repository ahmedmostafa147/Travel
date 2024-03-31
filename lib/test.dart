import 'package:intl/intl.dart';

void main(){
  print(isToday("29/01/2024"));

}


isToday(String date){
  String now = DateFormat("dd/MM/yyyy").format(DateTime.now());
  return now == date;
  
}
