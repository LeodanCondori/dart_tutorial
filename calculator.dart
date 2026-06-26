// To run this file: dart run calculator.dart

// =====================================================================
// A simple calculator using user input
// =====================================================================
// import 'dart:io';

// void main() {
//   print("=== Dart CLI Calculator ===");

//   // 1. Get First Number
//   stdout.write("Enter the first number: ");
//   // readLineSync returns a String? (nullable). We use ! to assert it's not null.
//   double num1 = double.parse(stdin.readLineSync()!);

//   // 2. Get Operation
//   stdout.write("Enter operation (+, -, *, /, ~/, %): ");
//   String operator = stdin.readLineSync()!;

//   // 3. Get Second Number
//   stdout.write("Enter the second number: ");
//   double num2 = double.parse(stdin.readLineSync()!);

//   // 4. Perform Calculation using switch
//   double result = 0;
//   bool isValid = true;

//   switch (operator) {
//     case '+':
//       result = num1 + num2;
//       break;
//     case '-':
//       result = num1 - num2;
//       break;
//     case '*':
//       result = num1 * num2;
//       break;
//     case '/':
//       if (num2 != 0) {
//         result = num1 / num2;
//       } else {
//         print("Error: Cannot divide by zero.");
//         isValid = false;
//       }
//       break;
//     case '~/':
//       if (num2 != 0) {
//         result = (num1 ~/ num2).toDouble();
//       } else {
//         print("Error: Cannot divide by zero.");
//         isValid = false;
//       }
//       break;
//     case '%':
//       if (num2 != 0) {
//         result = num1 % num2;
//       } else {
//         print("Error: Cannot divide by zero.");
//         isValid = false;
//       }
//       break;
//     default:
//       print("Error: Invalid operator.");
//       isValid = false;
//   }

//   // 5. Display Result
//   if (isValid) {
//     print("Result: $num1 $operator $num2 = $result");
//   }
// }

// =====================================================================
// A simple calculator: optimized version
// =====================================================================
import 'dart:io';

void main() {
  print("=== Dart CLI Calculator ===");

  double? num1 = _readNumber("Enter the first number: ");
  String operator = _readOperator("Enter operation (+, -, *, /, ~/, %): ");
  double? num2 = _readNumber("Enter the second number: ");

  if (num1 == null || num2 == null) {
    print("Error: Invalid number input.");
    return;
  }

  final operations = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => b != 0 ? a / b : double.nan,
    '~/': (a, b) => b != 0 ? (a ~/ b).toDouble() : double.nan,
    '%': (a, b) => b != 0 ? a % b : double.nan,
  };

  if (!operations.containsKey(operator)) {
    print("Error: Invalid operator.");
    return;
  }

  double result = operations[operator]!(num1, num2);
  if (result.isNaN) {
    print("Error: Cannot divide by zero.");
  } else {
    print("Result: $num1 $operator $num2 = $result");
  }
}

double? _readNumber(String prompt) {
  stdout.write(prompt);
  return double.tryParse(stdin.readLineSync() ?? "");
}

String _readOperator(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? "";
}
