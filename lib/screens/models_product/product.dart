class Product {
  final String name;
  final String category;
  final String subcategory;
  final double price;
  final int stock;
  final int minStock;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.subcategory,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.description,
  });

  bool get inStock => stock > 0;

  String get availabilityLevel {
    if (stock <= minStock) return 'Bajo';
    if (stock <= minStock * 2) return 'Medio';
    return 'Óptimo';
  }
}

const List<Product> demoProducts = [
  Product(name: 'Cuaderno Espiral A4', category: 'Papelería', subcategory: 'Cuadernos', price: 125.00, stock: 48, minStock: 15, description: 'Cuaderno espiral tamaño A4 de 100 hojas a cuadros, carátula resistente plastificada de alta durabilidad. Ideal para uso escolar y universitario.'),
  Product(name: 'Notas adhesivas 3x3', category: 'Papelería', subcategory: 'Post-it', price: 110.00, stock: 12, minStock: 15, description: 'Bloc de notas adhesivas de 3x3 pulgadas, ideal para recordatorios y organización de tareas.'),
  Product(name: 'Resma de Papel Bond', category: 'Papelería', subcategory: 'Hojas', price: 450.00, stock: 60, minStock: 20, description: 'Resma de papel bond tamaño carta, 500 hojas, 75 gramos, alta blancura.'),
  Product(name: 'Lápices de colores (12)', category: 'Útiles Escolares', subcategory: 'Lápices', price: 230.00, stock: 35, minStock: 10, description: 'Set de 12 lápices de colores de madera, ideales para dibujo y trabajos escolares.'),
];