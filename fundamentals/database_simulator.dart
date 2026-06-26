// Requirements:

//     The Setup: Create a mini program where you declare a late final String databaseConfig; at the top of main(). Initialize it a few lines down to practice using late final together.

//     The User Data: Create a Map<String, dynamic> representing a user profile retrieved from a server:

//     Map<String, dynamic> rawData = {
//   "username": "dart_master",
//   "role": "admin", // can be 'admin', 'moderator', 'guest'
//   "bio": null,     // Notice this is null
// };
// The Validation: Extract the data into local variables:

//         Extract username. Use the ! operator only if you are 100% certain it exists, or handle it safely.

//         Extract bio. Use ?? to default it to "No bio provided." if it is null.

//     The Role Check: Use a switch statement on the role key:

//         If 'admin', print a message showing full access.

//         If 'moderator', print a message showing partial access.

//         Use a default case to catch 'guest' or any unknown roles.

// Challenge Tip

// Try to write these using final for every variable that doesn't need to change its reassignment pointer, and try using an arrow function (=>) for at least one of your smaller helper calculations!


// To run this file: dart run database_simulator.dart

// =====================================================================
// A smart database simulator
// =====================================================================

void main() {
  print("=== Dart CLI Database Simulator ===");

  // The Setup: Declare and initialize late final
  late final String databaseConfig;
  databaseConfig = "Host: localhost, Port: 5432, User: admin";
  print("Database initialized: $databaseConfig");

  // The User Data
  Map<String, dynamic> rawData = {
    "username": "dart_master",
    "role": "admin",
    "bio": null,
  };

  // The Validation: Extract data
  // Using ??= for bio to provide a default value if null
  final String username = rawData["username"] as String;
  // Because of the '??', bio is guaranteed to be a String, never null!
  final String bio = rawData["bio"] as String? ?? "No bio provided.";
  final String role = rawData["role"] as String;

  // The Role Check: Use switch statement
  print("\n=== User Profile ===");
  print("Username: $username");
  print("Bio: $bio");
  print("Access Level:");

  switch (role) {
    case 'admin':
      print("✅ Full system access granted.");
      break;
    case 'moderator':
      print("🟡 Partial access granted.");
      break;
    case 'guest':
      print("🔵 Read-only access granted.");
      break;
    default:
      print("❓ Unknown role. Access denied.");
  }
}
