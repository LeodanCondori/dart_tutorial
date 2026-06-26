// To run this file: dart run shopping_cart.dart

// =====================================================================
// A smart shopping cart
// =====================================================================

// void main() {
//   print("=== Dart CLI Shopping Cart ===");

//   final inventory = {
//     "Apple": 1.5,
//     "Banana": 0.75,
//     "Milk": 3.20,
//   };

//   final cart = <String?>["Apple", "Banana", "Milk", null, "Bread"];

//   double total = calculateTotal(cart, inventory);

//   print("=== Receipt ===");
//   print("Total: \$$total");
// }

// double calculateTotal(List<String?> cart, Map<String, double> inventory) {
//   double total = 0;

//   for (String? item in cart) {
//     if (item == null) {
//       continue;
//     }

//     total += inventory[item] ?? 0.0;
//   }

//   return total;
// }

// =====================================================================
// A smart shopping cart optimized version
// =====================================================================
// void main() {
//   print("=== Dart CLI Shopping Cart ===\n");

//   final inventory = {
//     "Apple": 1.5,
//     "Banana": 0.75,
//     "Milk": 3.20,
//   };

//   // Added a couple more edge cases to test robustness
//   final cart = <String?>["Apple", "Banana", "Milk", null, "Bread", "Apple"];

//   double total = calculateTotal(cart, inventory);

//   print("\n=== Receipt ===");
//   // .toStringAsFixed(2) ensures it looks like real money (e.g., $6.95)
//   print("Total: \$${total.toStringAsFixed(2)}");
// }

// double calculateTotal(List<String?> cart, Map<String, double> inventory) {
//   double total = 0;

//   for (final item in cart) {
//     if (item == null) {
//       print("⚠️ Skipped a null/corrupted item slot.");
//       continue;
//     }

//     // Check if the item actually exists in the store inventory
//     if (!inventory.containsKey(item)) {
//       print("❌ Error: '$item' is not available in our inventory! (Charged: \$0.00)");
//     }

//     total += inventory[item] ?? 0.0;
//   }

//   return total;
// }

// =====================================================================
// A smart shopping cart, an optimized and clean version
// =====================================================================
void main() {
  print("=== Dart CLI Shopping Cart ===\n");

  final inventory = {
    "Apple": 1.5,
    "Banana": 0.75,
    "Milk": 3.20,
  };

  // Added a couple more edge cases to test robustness
  final cart = <String?>["Apple", "Banana", "Milk", null, "Bread", "Apple"];

  double total = calculateTotalAdvanced(cart, inventory);

  print("\n=== Receipt ===");
  // .toStringAsFixed(2) ensures it looks like real money (e.g., $6.95)
  print("Total: \$${total.toStringAsFixed(2)}");
}

double calculateTotalAdvanced(List<String?> cart, Map<String, double> inventory) {
  // .fold takes an initial value (0.0) and combines every item into it
  return cart.fold(0.0, (sum, item) => sum + (inventory[item] ?? 0.0));
}