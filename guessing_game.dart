// To run this file: dart run guessing_game.dart

// =====================================================================
// A simple guessing game using user input
// =====================================================================
import 'dart:io';
import 'dart:math';

void main() {
  print("=== Dart CLI Guessing Game ===");

  final random = Random();
  final secretNumber = random.nextInt(100) + 1; // 1-100
  int attempts = 0;

  while (true) {
    stdout.write("Enter your guess (1-100): ");
    final input = stdin.readLineSync()?.trim();
    
    if (input == null || input.isEmpty) {
      print("Please enter a valid number.");
      continue;
    }

    final guess = int.tryParse(input);
    if (guess == null) {
      print("Invalid input. Please enter a number.");
      continue;
    }

    attempts++;

    if (guess < secretNumber) {
      print("Too low!");
    } else if (guess > secretNumber) {
      print("Too high!");
    } else {
      print("Correct! You guessed it in $attempts attempts.");
      break;
    }
  }
}