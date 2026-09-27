import 'package:flutter/material.dart';

enum AlertSeverity { critical, warning, info }

class AlertStockItem {
  final String name;
  final String category;
  final int minStock;
  final int quantity;
  final IconData icon;
  final AlertSeverity severity;

  const AlertStockItem({
    required this.name,
    required this.category,
    required this.minStock,
    required this.quantity,
    required this.icon,
    required this.severity,
  });
}

const List<AlertStockItem> demoAlerts = [
  AlertStockItem(name: 'Cuaderno Espiral A4', category: 'Papelería', minStock: 15, quantity: 3, icon: Icons.menu_book, severity: AlertSeverity.critical),
  AlertStockItem(name: 'Lápiz Grafito HB', category: 'Escritura', minStock: 20, quantity: 5, icon: Icons.edit, severity: AlertSeverity.critical),
  AlertStockItem(name: 'Goma de borrar Blanca', category: 'Útiles', minStock: 25, quantity: 8, icon: Icons.crop_square, severity: AlertSeverity.critical),
  AlertStockItem(name: 'Marcador Permanente', category: 'Escritura', minStock: 20, quantity: 12, icon: Icons.brush, severity: AlertSeverity.warning),
  AlertStockItem(name: 'Resma de Papel Bond', category: 'Papelería', minStock: 30, quantity: 15, icon: Icons.description_outlined, severity: AlertSeverity.info),
  AlertStockItem(name: 'Corrector Líquido Tipo', category: 'Papelería', minStock: 10, quantity: 4, icon: Icons.edit_note, severity: AlertSeverity.critical),
  AlertStockItem(name: 'Tijera Escolar Punta Redonda', category: 'Útiles', minStock: 15, quantity: 6, icon: Icons.content_cut, severity: AlertSeverity.critical),
  AlertStockItem(name: 'Pegamento en Barra 40g', category: 'Manualidades', minStock: 12, quantity: 2, icon: Icons.format_paint, severity: AlertSeverity.critical),
];

const int totalActiveAlerts = 22;