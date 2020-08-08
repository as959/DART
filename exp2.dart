import 'dart:io';
main() {
  print("Hello and welcome to the second dart program !!\n");
  List num1 = List();
  stdout.writeln("Please enter number of elements you wanna insert :");
  int n = int.parse(stdin.readLineSync());
  for( var i = 0 ; i < n; i++ ) { 
	    stdout.writeln("Please enter number:");
  		int e = int.parse(stdin.readLineSync());
      num1.add(e); 
   }
	int max=-999;
	for (int ele in num1) {
    if(max<ele){
		max=ele;
		}
  } 
	print(num1);
	print("Maximum value in given list is: $max");

//List operartions
num1.add(1000);
num1.add("hello"); //note:Cant add string to int specified list
num1.remove(900);
num1.removeAt(2);
print(num1);
num1.clear();
}