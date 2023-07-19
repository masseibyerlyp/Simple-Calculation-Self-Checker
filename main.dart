import 'dart:io';
import 'dart:math';

class MathQuestion {
  Random random = Random();
  late String question;
  late double answer;
  MathQuestion() {
    List<String> operators = ['+', '-', '*', '/'];
    String op = operators[random.nextInt(operators.length)];

    switch (op) {
      case '+':
        int a = random.nextInt(100);
        int b = random.nextInt(100);
        this.question = '$a $op $b';
        this.answer = (a + b).toDouble();
        break;
      case '-':
        int b = random.nextInt(100);
        int a = b + random.nextInt(100);
        this.question = '$a $op $b';
        this.answer = (a - b).toDouble();
        break;
      case '*':
        int a = random.nextInt(20);
        int b = random.nextInt(20);
        this.answer = (a * b).toDouble();
        break;
      case '/':
        int b = random.nextInt(20);
        int a = b * random.nextInt(100);      
        this.answer = (a / b).toDouble();
        break;
    }
  }
}

double prompt() {
  print("请输入答案:");
  double response = double.parse(stdin.readLineSync()!);
  return response;
}

int Number() {
  print("请输入题目的个数:");
  int Num = int.parse(stdin.readLineSync()!);
  return Num;
}

void main() {
  int score = 0;
  int Num = Number();
  for (int i = 0; i < Num; i++) {
    MathQuestion question = MathQuestion();
    print(question.question);
    double response = prompt();
    if (response == question.answer) {
      print('正确！');
      score++;
    } else {
      print('错误！正确答案是${question.answer}');
    }
  }
  print("你的分数是${score / Num * 100}");
}
