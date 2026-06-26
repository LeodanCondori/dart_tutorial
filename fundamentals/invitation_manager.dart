// To run this file: dart run invitation_manager.dart

// =====================================================================
// A smart invitation manager for a party
// =====================================================================

void main() {
  print("=== Dart CLI Invitation Manager ===\n");

  final rsvps = ["Alice", "Bob", "Charlie", "Alice", "David", "Bob"];

  // Unique guest list
  final guests = rsvps.toSet();

  // Simulated email database (Notice Charlie and David don't have emails)
  final Map<String, String?> emailDatabase = {
    "Alice": "alice@email.com",
    "Bob": "bob@email.com",
    // Charlie is missing from the database entirely -> returns null
    // David is explicitly null
    "David": null,
  };

  for (final guest in guests) {
    // 1. Look up the email. If they aren't in the map, it safely returns null.
    final String? guestEmail = emailDatabase[guest];

    // 2. Mix up the table assignments to test your default parameter!
    if (guest == "Alice") {
      // Alice gets a VIP table
      sendInvite(name: guest, email: guestEmail, tableNumber: "VIP Table 1");
    } else {
      // Everyone else relies on your "General Seating" default value
      sendInvite(name: guest, email: guestEmail); 
    }
  }
}

void sendInvite({
  required String name,
  String? email,
  String tableNumber = "General Seating", // Default parameter
}) {
  if (email == null) {
    print("⚠️ $name needs a manual phone call for Table: $tableNumber");
  } else {
    print("📧 Email sent to $name at $email for Table: $tableNumber");
  }
}