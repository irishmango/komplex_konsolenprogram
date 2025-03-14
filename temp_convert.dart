import 'dart:io';

double celsiusToFahrenheit(double value) {
  return value * 9 / 5 + 32;
}

double fahrenheitToCelsius(double value) {
  return (value - 32) * 5 / 9;
}

int userChoice() {
  print("Was möchtest du umrechnen?");
  print("1: Celsius => Fahrenheit");
  print("2: Fahrenheit => Celsius");

  String? input = stdin.readLineSync();
  return int.parse(input!);
}

void main() {
  int choice = userChoice();

  print("Gib den Temperaturwert ein:");
  String? input = stdin.readLineSync();
  double value = double.parse(input!);

  double result;

  if (choice == 1) {
    result = celsiusToFahrenheit(value);
    print("$value°C = ${result.toStringAsFixed(2)}°F");
  } else if (choice == 2) {
    result = fahrenheitToCelsius(value);
    print("$value°F = ${result.toStringAsFixed(2)}°C");
  } else {
    print("Ungültige Auswahl.");
  }
}

