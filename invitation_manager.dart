// Requirements:

//     The Clean-up: You are given a List<String> of names who RSVP'd, but some people submitted their names twice. Convert this list into a Set<String> to instantly eliminate duplicates.

//     The Invitation Function: Write a function called sendInvite with the following parameters:

//         required String name

//         String? email (Optional/Nullable)

//         String tableNumber = "General Seating" (Named parameter with a default value)

//     The Flow: Loop through your clean Set of guests and call sendInvite for each.

//         Inside the function, use an if-else statement or a null-aware assignment (??=) to check if the email is missing. If it is null, print: "⚠️ [Name] needs a manual phone call for Table: [tableNumber]".

//         If the email exists, print: "📧 Email sent to [Name] at [email] for Table: [tableNumber]".
        
// To run this file: dart run invitation_manager.dart

// =====================================================================
// A smart invitation manager for a party
// =====================================================================

void main() {
  print("=== Dart CLI Invitation Manager ===");

  final rsvps = [
    "Alice",
    "Bob",
    "Charlie",
    "Alice",
    "David",
    "Bob",
  ];

  final guests = rsvps.toSet();

  for (final guest in guests) {
    sendInvite(name: guest, email: "[EMAIL_ADDRESS]", tableNumber: "Table 3");
  }
}

void sendInvite({
  required String name,
  String? email,
  String tableNumber = "General Seating",
}) {
  if (email == null) {
    print("⚠️ $name needs a manual phone call for Table: $tableNumber");
  } else {
    print("📧 Email sent to $name at $email for Table: $tableNumber");
  }
}