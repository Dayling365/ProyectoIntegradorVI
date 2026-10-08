class Product {
  final String name;
  final String category;
  final String subcategory;
  final String brand;
  final double price;
  final int stock;
  final int minStock;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.subcategory,
    required this.brand,
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
  Product(name: 'Cuaderno Espiral A4', category: 'Papelería', subcategory: 'Cuadernos', brand: 'Norma', price: 125.00, stock: 48, minStock: 15, description: 'Cuaderno espiral tamaño A4 de 100 hojas a cuadros, carátula resistente plastificada de alta durabilidad. Ideal para uso escolar y universitario.'),
  Product(name: 'Notas adhesivas 3x3', category: 'Papelería', subcategory: 'Post-it', brand: '3M', price: 110.00, stock: 12, minStock: 15, description: 'Bloc de notas adhesivas de 3x3 pulgadas, ideal para recordatorios y organización de tareas.'),
  Product(name: 'Resma de Papel Bond', category: 'Papelería', subcategory: 'Hojas', brand: 'Chamex', price: 450.00, stock: 60, minStock: 20, description: 'Resma de papel bond tamaño carta, 500 hojas, 75 gramos, alta blancura.'),
  Product(name: 'Lápices de colores (12)', category: 'Útiles Escolares', subcategory: 'Lápices', brand: 'Faber-Castell', price: 230.00, stock: 35, minStock: 10, description: 'Set de 12 lápices de colores de madera, ideales para dibujo y trabajos escolares.'),
  Product(name: 'Lápiz Grafito HB', category: 'Escritura', subcategory: 'Lápices', brand: 'Staedtler', price: 8.00, stock: 6, minStock: 20, description: 'Lápiz de grafito HB con borrador, trazo suave y punta resistente.'),
  Product(name: 'Goma de borrar Blanca', category: 'Útiles Escolares', subcategory: 'Borradores', brand: 'Pelikan', price: 12.00, stock: 8, minStock: 25, description: 'Goma de borrar blanca que no mancha el papel.'),
  Product(name: 'Marcador Permanente', category: 'Escritura', subcategory: 'Marcadores', brand: 'Sharpie', price: 35.00, stock: 12, minStock: 20, description: 'Marcador permanente de punta fina, tinta de secado rápido.'),
  Product(name: 'Corrector Líquido', category: 'Papelería', subcategory: 'Correctores', brand: 'Pelikan', price: 28.00, stock: 4, minStock: 10, description: 'Corrector líquido de secado rápido con aplicador de punta.'),
  Product(name: 'Tijera Escolar Punta Redonda', category: 'Útiles Escolares', subcategory: 'Tijeras', brand: 'Maped', price: 45.00, stock: 6, minStock: 15, description: 'Tijera escolar con punta redonda y mango ergonómico.'),
  Product(name: 'Pegamento en Barra 40g', category: 'Manualidades', subcategory: 'Pegamentos', brand: 'UHU', price: 30.00, stock: 2, minStock: 12, description: 'Pegamento en barra de 40 g, no tóxico y fácil de aplicar.'),
];