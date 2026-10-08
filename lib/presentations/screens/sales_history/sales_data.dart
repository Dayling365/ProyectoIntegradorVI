import 'widgets_sales_details/sales_items_list.dart';

String formatMoney(double value) {
  final parts = value.toStringAsFixed(2).split('.');
  final whole = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (m) => ',',
  );
  return '$whole.${parts[1]}';
}

String _two(int n) => n.toString().padLeft(2, '0');

const List<String> _months = [
  'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
  'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
];

String formatDate(DateTime d) => '${_two(d.day)}/${_two(d.month)}/${d.year}';

String formatDateTime(DateTime d) {
  final h12 = d.hour % 12 == 0 ? 12 : d.hour % 12;
  final ampm = d.hour >= 12 ? 'PM' : 'AM';
  return '${_two(d.day)} ${_months[d.month - 1]} ${d.year} • '
      '${_two(h12)}:${_two(d.minute)} $ampm';
}

const String _admin = 'Don César Admin';
const String _carlos = 'Carlos Martínez';

const List<String> kClients = [
  'Todos',
  'Genérico',
  'Instituto Juan XXIII',
  'Distribuidora del Norte',
];

class SaleRecord {
  final String invoiceNumber;
  final String clientName;
  final String sellerName;
  final DateTime date;
  final List<SaleLineItem> items;
  final double cashGiven;

  const SaleRecord({
    required this.invoiceNumber,
    required this.clientName,
    required this.sellerName,
    required this.date,
    required this.items,
    required this.cashGiven,
  });

  double get subtotal => items.fold(0.0, (sum, i) => sum + i.subtotal);
  double get total => subtotal;
  double get change => cashGiven - total;

  String get amount => 'C\$${formatMoney(total)}';
  String get dateLabel => formatDateTime(date);
  String get productsSummary =>
      items.map((i) => '${i.quantity}x ${i.name}').join(', ');
}

class _Product {
  final String name;
  final String category;
  final double price;

  const _Product(this.name, this.category, this.price);
}

const List<_Product> _catalog = [
  _Product('Cuaderno Espiral A4 (100 hojas)', 'Papelería', 125),
  _Product('Bolígrafo azul Bic Cristal', 'Papelería', 35),
  _Product('Resma de Papel Bond 75g', 'Hojas', 165),
  _Product('Marcador permanente negro', 'Marcadores', 28),
  _Product('Caja de Bolígrafos (12 u.)', 'Papelería', 180),
  _Product('Cuaderno Universitario (docena)', 'Cuadernos', 780),
  _Product('Lápiz grafito HB (caja 12)', 'Escritura', 95),
  _Product('Folder manila carta (paq. 25)', 'Archivo', 110),
  _Product('Tijera escolar punta roma', 'Útiles', 45),
  _Product('Pegamento en barra 40g', 'Útiles', 32),
  _Product('Calculadora científica', 'Útiles', 420),
  _Product('Mochila escolar', 'Accesorios', 650),
  _Product('Cartulina escolar (pliego)', 'Papelería', 12),
  _Product('Témperas 6 colores', 'Arte', 85),
];

int _dayFor(int i) => 31 - (i * 30) ~/ 49;

SaleRecord _buildSale(int i) {
  final clientIndex = i % 3;
  final multiplier = 1 + clientIndex;
  final lines = 2 + (i ~/ 3) % 3;

  final items = <SaleLineItem>[];
  for (int k = 0; k < lines; k++) {
    final product = _catalog[(i * 3 + k * 5) % _catalog.length];
    final qty = (1 + (i + k * 2) % 4) * multiplier;
    items.add(
      SaleLineItem(
        product.name,
        product.category,
        qty,
        product.price,
        qty * product.price,
      ),
    );
  }

  final total = items.fold(0.0, (sum, item) => sum + item.subtotal);
  final day = _dayFor(i);
  final hour = i > 0 && _dayFor(i - 1) == day ? 10 : 16;
  final minute = ((i * 13) % 12) * 5;
  final seller =
      (i % 10 == 0 || i % 10 == 3 || i % 10 == 7) ? _admin : _carlos;

  return SaleRecord(
    invoiceNumber: 'Factura #F-00${1297 - i}',
    clientName: kClients[1 + clientIndex],
    sellerName: seller,
    date: DateTime(2026, 10, day, hour, minute),
    items: items,
    cashGiven: ((total / 50).ceil() * 50).toDouble(),
  );
}

final List<SaleRecord> kSales = List.generate(50, _buildSale);