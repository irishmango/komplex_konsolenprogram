import 'dart:io';

// Function that takes optional x and y from prompt
double calculate({double? x, double? y}) {
  // Prompt for x if not provided
  if (x == null) {
    print("Bitte gib den Wert für x ein:");
    String? inputX = stdin.readLineSync();
    x = inputX != null && inputX.isNotEmpty
        ? double.parse(inputX)
        : 0; // Default to 0 if input is null or empty
  }

  if (y == null) {
    print("Bitte gib den Wert für y ein:");
    String? inputY = stdin.readLineSync();
    y = inputY != null && inputY.isNotEmpty
        ? double.parse(inputY)
        : 0; // Default to 0 if input is null or empty
  }

  print("Wähle eine Operation: +  -  *  /");
  String operator = stdin.readLineSync() ?? '';

  double result = 0;

  switch (operator) {
    case '+':
      result = x + y;
      break;
    case '-':
      result = x - y;
      break;
    case '*':
      result = x * y;
      break;
    case '/':
      if (y == 0) {
        print("Division durch null ist nicht erlaubt!");
        return 0;
      }
      result = x / y;
      break;
    default:
      print("Ungültige Operation.");
      return 0;
  }

  return result;
}

void main() {
  double result = calculate(); 
  print("Das Ergebnis ist: $result");
}

