// dart run dart_fundamentals.dart

// =====================================================================
// print("Hello, World!");
// =====================================================================
// void main() {
//   print("Hello, World!");
// }

// =====================================================================
// Variables & Data Types (`var`, `final`, `const`, `dynamic`)
// =====================================================================
// void main() {
//   // var: declares a variable whose type is inferred from the value assigned to it.
//   var name = "John"; // Dart immediately locks this in as a String
//   name = "Doe";      // ✅ Allowed (It's still a String)
//   // name = 25;         // ❌ ERROR! You can't put an integer into a String variable.
//   print(name);

//   // final: declares a variable that can only be assigned once.
//   final age = 25;    // You CANNOT change this later
//   // age = 30;          // ❌ ERROR! You can't assign a value to a final variable more than once.
//   print(age);

//   // const: declares a variable that is known at compile time.
//   const pi = 3.14; // This is a true compile-time constant. It must be known when the code is compiled.
//   print(pi);

//   // dynamic: declares a variable that can have any type.
//   dynamic my_age = 25; // Currently an int
//   my_age = "John";     // ✅ Allowed! It is now a String
//   my_age = true;       // ✅ Allowed! It is now a boolean
//   print(my_age);
// }

// =====================================================================
// Operators and String interpolation
// =====================================================================
// void main() {
//   // Arithmetic operators
//   int a = 10;
//   int b = 3;
//   print("sum: ${a + b}"); // 13
//   print("difference: ${a - b}"); // 7
//   print("product: ${a * b}"); // 30
//   print("division always generates a double value: ${a / b}"); // 3.333...
//   print("integer division or floor: ${a ~/ b}"); // 3 (integer division)
//   print("remainder or modulo: ${a % b}"); // 1 (remainder)

//   // String Interpolation
//   var name = "John";
//   var age = 25;
//   print("My name is $name and I am $age years old.");
//   print("My name is ${name.toUpperCase()} and I am ${age + 5} years old.");
// }

// =====================================================================
// Control Flow (`if`, `else`, `switch`, loops: `for`, `while`, `do-while`, `forEach`)
// =====================================================================
// void main() {
//   // 1. If / Else Statements
//   int score = 85;
//   if (score >= 90) {
//     print("Grade: A");
//   } else if (score >= 80) {
//     print("Grade: B"); // This will execute
//   } else {
//     print("Grade: C");
//   }

//   // 2. Switch Statements (Modern Dart with Pattern Matching)
//   String status = 'ready';
//   switch (status) {
//     case 'loading':
//       print("App is loading...");
//     case 'ready' || 'success': // Combined cases using logical OR (`||`)
//       print("App is ready to use!");
//     case 'error':
//       print("Something went wrong.");
//     default:
//       print("Unknown status.");
//   }

//   String command = "update_available";
//   switch (command) {
//     case 'update_available':
//       print("Downloading update...");
//       continue runSetup; // Tells Dart to jump to the label below

//       runSetup: // This is a label
//     case 'ready':
//       print("Running app setup...");
//   }

//   // Bonus: Switch Expression (Returns a value directly)
//   int numbersOfPizza = 3;
//   String message = switch (numbersOfPizza) {
//     1 => "Just for me",
//     2 || 3 => "Perfect for a date",
//     _ => "Party time!" // `_` acts as the default fallback
//   };
//   print(message);

//   print("--- Loops ---");

//   // 3. Standard For Loop (When you need the index)
//   for (int i = 0; i < 3; i++) {
//     print("Standard for count: $i");
//   }

//   // 4. For-in Loop (Best for iterating through collections)
//   var fruits = ['Apple', 'Banana', 'Orange'];
//   for (var fruit in fruits) {
//     print("Fruit: $fruit");
//   }

//   // 5. ForEach Loop (Method on iterables using an anonymous function)
//   fruits.forEach((fruit) => print("forEach Fruit: $fruit"));

//   // 6. While Loop (Checks condition BEFORE running)
//   int count = 0;
//   while (count < 3) {
//     print("While count: $count");
//     count++;
//   }

//   // 7. Do-While Loop (Guaranteed to run AT LEAST once BEFORE checking condition)
//   int cookiesLeft = 0;
//   do {
//     print("Eating a cookie..."); // Runs once even though cookiesLeft is 0
//   } while (cookiesLeft > 0);
// }

// =====================================================================
// Functions (parameters, optional, named, default values, arrow functions)
// =====================================================================
void main() {
  // Calling a basic function
  printGreeting("Leo");

  // Calling a function with optional positional parameters
  printFormat("Log file updated", true);
  printFormat("System rebooted"); // Works without the second argument

  // Calling a function with named parameters (Order doesn't matter!)
  configureServer(host: "localhost", port: 8080);
  configureServer(port: 3000, host: "127.0.0.1"); // Also valid

  // Calling a function with mixed required and optional named parameters
  createUser(username: "dev_leo"); // uses default role 'user'
  createUser(username: "admin_leo", role: "admin");

  // Calling an arrow function
  print("Square of 5: ${square(5)}");
}

// 1. Basic Function (Required Positional Parameters)
void printGreeting(String name) {
  print("Hello, $name!");
}

// 2. Optional Positional Parameters (Wrapped in square brackets `[]`)
// They must be at the end, and they need a default value or be nullable.
void printFormat(String message, [bool uppercase = false]) {
  if (uppercase) {
    print(message.toUpperCase());
  } else {
    print(message);
  }
}

// 3. Named Parameters (Wrapped in curly braces `{}`)
// Highly used in Flutter! They are optional by default unless marked `required`.
void configureServer({required String host, required int port}) {
  print("Server running on http://$host:$port");
}

// 4. Named Parameters with Default Values
void createUser({required String username, String role = "user"}) {
  print("Created user: $username with role: $role");
}

// 5. Arrow Functions (`=>`)
// A shorthand syntax for functions that contain exactly ONE expression or return statement.
int square(int number) => number * number;