import 'dart:io';

void main() {
  String name = welcomeUser();
  
  int score = 0;

  // List of questions
  List<Map<String, dynamic>> quiz = [
    {
      'question': "What is the largest planet in the solar system?",
      'options': ['a - Earth', 'b - Mars', 'c - Jupiter', 'd - Saturn'],
      'answer': 'c'
    },
    {
      'question': "What is the country with the largest population?",
      'options': ['a - India', 'b - USA', 'c - China', 'd - Russia'],
      'answer': 'a'
    },
    {
      'question': "Who created Flutter?",
      'options': ['a - Apple', 'b - Google', 'c - IBM', 'd - Samsung'],
      'answer': 'b'
    },
    {
      'question': "What is the capital city of France?",
      'options': ['a - Berlin', 'b - Madrid', 'c - Paris', 'd - Rome'],
      'answer': 'c'
    },
    {
      'question': "Which programming language is used to develop Flutter apps?",
      'options': ['a - Java', 'b - Dart', 'c - Kotlin', 'd - Swift'],
      'answer': 'b'
    },
  ];

  // Ask each question
  for (var q in quiz) {
    bool correct = askQuestion(q);
    if (correct) {
      score++;
    }
  }

  double percentage = (score / quiz.length) * 100;
  print("\nGreat job, $name! You completed the quiz.");
  print("You got a score of: $percentage%!");
}


String welcomeUser() {
  print("Hi! What can I call you?");
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    name = "Guest";
  }

  print("Hi, $name! Get ready to test your knowledge!");
  print("Press Enter to continue.");
  stdin.readLineSync();

  return name;
}



bool askQuestion(Map<String, dynamic> q) {
  print("\n${q['question']}");
  q['options'].forEach(print);

  String input = stdin.readLineSync()?.toLowerCase() ?? '';

  if (!['a', 'b', 'c', 'd'].contains(input)) {
    print("Invalid Answer. Please enter a, b, c, or d.");
    return askQuestion(q); // if invalid input, question is repeated
  }

  if (input == q['answer']) {
    print("Correct! Well done!");
    return true;
  } else {
    print("Wrong Answer! Bad luck.");
    return false;
  }
}