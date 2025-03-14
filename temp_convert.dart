import 'dart:io';

// Function Celsius to Fahrenheit
double celsiusToFahrenheit(double value) {
  return value * 9 / 5 + 32;
}

// Function Fahrenheit to Celsius
double fahrenheitToCelsius(double value) {
  return (value - 32) * 5 / 9;
}

// User chooses what direction the conversion should run
int userChoice() {
  print("Was möchtest du umrechnen?");
  print("1: Celsius => Fahrenheit");
  print("2: Fahrenheit => Celsius");

  String? input = stdin.readLineSync();
  return int.parse(input!);
}

void main() {
  int choice = userChoice();

  // Validates choice before moving on
  if (choice != 1 && choice != 2) {
    print("Ungültige Auswahl.");
    return; // Stops the program early
  }

  print("Gib den Temperaturwert ein:");
  String? input = stdin.readLineSync();
  double value = double.parse(input!);

  double result;

  if (choice == 1) {
    result = celsiusToFahrenheit(value);
    print("$value°C = ${result.toStringAsFixed(2)}°F");
  } else {
    result = fahrenheitToCelsius(value);
    print("$value°F = ${result.toStringAsFixed(2)}°C");
  }
}