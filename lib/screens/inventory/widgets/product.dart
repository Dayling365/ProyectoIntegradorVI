class Product {
  final String name;
  final String category;
  final String subcategory;
  final double price;
  final bool inStock;

  const Product({
    required this.name,
    required this.category,
    required this.subcategory,
    required this.price,
    required this.inStock,
  });
}

const List<Product> demoProducts = [
  Product(name: 'Cuaderno Espiral A4', category: 'Papelería', subcategory: 'Cuadernos', price: 125.00, inStock: true),
  Product(name: 'Notas adhesivas 3x3', category: 'Papelería', subcategory: 'Post-it', price: 110.00, inStock: false),
  Product(name: 'Resma de Papel Bond', category: 'Papelería', subcategory: 'Hojas', price: 450.00, inStock: true),
  Product(name: 'Lápices de colores (12)', category: 'Útiles Escolares', subcategory: 'Lápices', price: 230.00, inStock: true),
];