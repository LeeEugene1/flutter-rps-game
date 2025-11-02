import 'dart:io';
import 'dart:convert';
void main(){
  String text = '가위바위보 중 하나를 정해서 입력해주세요';
  print(text);

  //final: 상수
  final String userInput = stdin.readLineSync(encoding: utf8) ?? 'Error';
  print(userInput);
}