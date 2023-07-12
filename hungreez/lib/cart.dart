class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }

  double getTotal() {
    double total = 0.0;
    for (var item in items) {
      total += item.totalPrice();
    }
    return total;
  }
}

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});

  double totalPrice() {
    return price * quantity;
  }
}