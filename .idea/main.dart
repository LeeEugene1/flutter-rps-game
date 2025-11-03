import 'dart:io';
import 'dart:convert';
import 'dart:math';

void main(){

  const selectList = ['가위', '바위', '보'];
  bool playagain = true;
  while(playagain){
    String text = '\n가위, 바위, 보 중 하나를 정해서 입력해주세요';
    print(text);

    final String userInput = stdin.readLineSync(encoding: utf8) ?? 'Error';
    final cpuInput = selectList[Random().nextInt(3)];
    print('cpu의 선택: $cpuInput');
    final result = getResult(userInput, cpuInput);
    print(result);

    //다시 하기 여부 묻기
    stdout.write('\n다시 하시겠습니까? (네/아니오):\n');
    final answer = stdin.readLineSync(encoding: utf8)?.trim().toLowerCase();
    if(answer != '네'){
      playagain = false;
      print('\n게임을 종료합니다!');
    }
  }
}

String getResult(String userInput, String cpuInput){
  const cpuWin = 'CPU가 승리 하였습니다.';
  const playerWin = '당신이 승리하였습니다.';
  const draw = '비겼습니다.';
  String result = draw;

  switch (userInput) {
    case '가위':
      if (cpuInput == '바위') {
        result = cpuWin;
      } else if (cpuInput == '보') {
        result = playerWin;
      }
      break;

    case '바위':
      if (cpuInput == '보') {
        result = cpuWin;
      } else if (cpuInput == '가위') {
        result = playerWin;
      }
      break;

    case '보':
      if (cpuInput == '가위') {
        result = cpuWin;
      } else if (cpuInput == '바위') {
        result = playerWin;
      }
      break;

    default:
      result = '올바른 값을 입력해주세요.';
  }
  return result;
}