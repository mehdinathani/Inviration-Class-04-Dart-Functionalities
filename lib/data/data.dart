class Product {
  final String name;
  final String description;
  bool isFav;
  int quantity;
  final String category;

  Product({
    required this.name,
    required this.description,
    this.isFav = false,
    required this.quantity,
    required this.category,
  });
}

List<Product> productList = [
  Product(
    name: "Remote",
    description: "TV operate",
    quantity: 1,
    category: "Electronics",
  ),
  Product(
    name: 'Laptop',
    description: 'A high-performance laptop for all your work needs.',
    isFav: false,
    quantity: 1,
    category: 'Electronics',
  ),
  Product(
    name: 'Wireless Mouse',
    description: 'A smooth and precise wireless mouse.',
    isFav: false,
    quantity: 1,
    category: 'Accessories',
  ),
  Product(
    name: 'Office Chair',
    description: 'Ergonomic office chair for long working hours.',
    isFav: false,
    quantity: 1,
    category: 'Furniture',
  ),
  Product(
    name: 'Smartphone',
    description: 'Latest smartphone with cutting-edge technology.',
    isFav: false,
    quantity: 1,
    category: 'Electronics',
  ),
  Product(
    name: 'Water Bottle',
    description: 'Insulated water bottle to keep your drink cool or hot.',
    isFav: false,
    quantity: 1,
    category: 'Home & Kitchen',
  ),
];
