import 'dart:io';

main() {
  print("Hello and welcome to the first dart program !!\n");
//type interferance
  var b = 5;
  stdout.writeln("Please enter name :");
  String name = stdin.readLineSync();
//static type
  int age = 20;
  print("Name :$name Age: $age");
  dynamic dyn = 'hello';
  print('Dynamic before:$dyn');
  dyn = 9;
  print('Dynamic after:$dyn');
/*
this is 
a
multiline comment */
}
