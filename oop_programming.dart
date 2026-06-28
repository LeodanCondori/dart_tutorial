// To run this file: dart run oop_programming.dart

// =====================================================================
// Classes & Objects
// =====================================================================
// 1. Defining a Class
// class User {
//   // Instance Variables (Fields)
//   final String username; // Read-only after initialization
//   String _email;         // Private variable (prefixed with an underscore '_')
//   int age;

//   // 2. Generative Constructor with Syntactic Sugar
//   // 'this.username' automatically assigns the parameter to the field.
//   User(this.username, this._email, this.age);

//   // 3. Named Constructor
//   // Useful for creating objects with alternative initialization paths.
//   User.guest() 
//       : username = "Guest_${DateTime.now().millisecondsSinceEpoch}",
//         _email = "guest@example.com",
//         age = 18;

//   // 4. Redirecting Constructor
//   // Redirects to the main constructor with a default value.
//   User.moderator(String username, String email) : this(username, email, 30);

//   // 5. Custom Getter and Setter
//   // Allows controlled access to private variables.
//   String get email => _email;
  
//   set email(String newEmail) {
//     if (newEmail.contains("@")) {
//       _email = newEmail;
//     } else {
//       print("❌ Invalid email format!");
//     }
//   }

//   // 6. Instance Method
//   // A function inside a class that operates on its data.
//   void displayProfile() {
//     print("User: $username | Email: $_email | Age: $age");
//   }
// }

// void main() {
//   print("=== Dart CLI Classes & Objects ===\n");

//   // 7. Instantiating Objects (Creating instances of a class)
//   // Note: The 'new' keyword is optional in Dart, we just call the constructor directly.
//   final user1 = User("dart_master", "master@dart.dev", 25);
//   user1.displayProfile();

//   // 8. Interacting with Getters and Setters
//   user1.email = "new_email@dart.dev"; // Calls the custom setter
//   print("Updated Email via Getter: ${user1.email}\n");

//   // 9. Using Named and Redirecting Constructors
//   final guestUser = User.guest();
//   print("Guest User Profile:");
//   guestUser.displayProfile();
//   print("");

//   final modUser = User.moderator("mod_alice", "alice@mod.dev");
//   print("Moderator User Profile:");
//   modUser.displayProfile();
// }

// =====================================================================
// Constructors (Generative, Named, Factory, Const)
// =====================================================================
class Configuration {
  final String environment;
  final int timeout;

  // 1. Default / Generative Constructor
  // The standard constructor used to create a regular instance.
  Configuration(this.environment, this.timeout);

  // 2. Named Constructor
  // Provides clarity by giving an alternative, explicit initialization path.
  Configuration.development()
      : environment = "development",
        timeout = 30;

  // 3. Factory Constructor (`factory`)
  // Doesn't always create a *new* instance. It can return an existing instance 
  // from a cache, or even return an instance of a different subclass.
  // Common use case: Creating an object from JSON/Map data.
  factory Configuration.fromJson(Map<String, dynamic> json) {
    // We can run logic here before returning the object
    final env = json['env'] as String? ?? 'production';
    final tOut = json['timeout'] as int? ?? 60;
    
    return Configuration(env, tOut);
  }
}

// 4. Const Constructor (`const`)
// If a class only has 'final' fields, its constructor can be marked 'const'.
// This allows Dart to create compile-time constants, saving memory by 
// reusing the exact same instance in memory if called with identical values.
class ImmutablePoint {
  final double x;
  final double y;

  // Const constructor
  const ImmutablePoint(this.x, this.y);
}

void main() {
  print("=== Dart CLI Constructors Reference ===\n");

  // --- Testing Generative & Named ---
  final config1 = Configuration("production", 10);
  final config2 = Configuration.development();
  print("Config 1: ${config1.environment} (Timeout: ${config1.timeout}s)");
  print("Config 2: ${config2.environment} (Timeout: ${config2.timeout}s)\n");

  // --- Testing Factory ---
  final Map<String, dynamic> mockJson = {"env": "staging", "timeout": 45};
  // The factory syntax looks like a normal constructor from the outside
  final configFromJson = Configuration.fromJson(mockJson);
  print("Factory Config: ${configFromJson.environment} (Timeout: ${configFromJson.timeout}s)\n");

  // --- Testing Const ---
  // Notice the use of the 'const' keyword during instantiation
  final p1 = const ImmutablePoint(1.0, 2.0);
  final p2 = const ImmutablePoint(1.0, 2.0);
  final p3 = ImmutablePoint(1.0, 2.0); // Not created as a const

  // // Dart reuses the identical memory address for p1 and p2!
  print("Are p1 and p2 identical in memory? ${identical(p1, p2)}"); // Prints: true
  print("Are p1 and p3 identical in memory? ${identical(p1, p3)}"); // Prints: false
}