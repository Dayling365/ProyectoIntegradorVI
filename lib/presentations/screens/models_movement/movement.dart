import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class Movement {
  final String registroId;
  final String movementLabel;
  final Color movementColor;
  final Color movementBgColor;
  final IconData movementIcon;
  final int cantidadInvolucrada;
  final int stockPrevio;
  final int stockFinal;
  final String fechaHora;
  final String motivo;
  final String codigoProducto;
  final String productName;
  final String sku;
  final String category;
  final int cantidadIngresada;
  final double costoUnitario;
  final double valorTotalLote;
  final bool esAlerta;

  const Movement({
    required this.registroId,
    required this.movementLabel,
    required this.movementColor,
    required this.movementBgColor,
    required this.movementIcon,
    required this.cantidadInvolucrada,
    required this.stockPrevio,
    required this.stockFinal,
    required this.fechaHora,
    required this.motivo,
    required this.codigoProducto,
    required this.productName,
    required this.sku,
    required this.category,
    required this.cantidadIngresada,
    required this.costoUnitario,
    required this.valorTotalLote,
    this.esAlerta = false,
  });
}


const List<Movement> demoMovements = [
  Movement(
    registroId: '1042',
    movementLabel: 'Entrada',
    movementColor: AppColors.success,
    movementBgColor: AppColors.successTint,
    movementIcon: Icons.shopping_bag_outlined,
    cantidadInvolucrada: 30,
    stockPrevio: 20,
    stockFinal: 50,
    fechaHora: '25/09/2025 • 10:42 AM',
    motivo: 'Compra',
    codigoProducto: '108',
    productName: 'Cuaderno Espiral A4',
    sku: 'CUA-A4-100',
    category: 'Papelería',
    cantidadIngresada: 30,
    costoUnitario: 40.00,
    valorTotalLote: 1200.00,
  ),
  Movement(
    registroId: '1041',
    movementLabel: 'Salida',
    movementColor: AppColors.error,
    movementBgColor: AppColors.errorTint,
    movementIcon: Icons.point_of_sale_outlined,
    cantidadInvolucrada: -40,
    stockPrevio: 100,
    stockFinal: 60,
    fechaHora: '24/09/2025 • 04:15 PM',
    motivo: 'Venta',
    codigoProducto: '112',
    productName: 'Lápiz Grafito HB',
    sku: 'LAP-HB-01',
    category: 'Escritura',
    cantidadIngresada: 0,
    costoUnitario: 5.00,
    valorTotalLote: 200.00,
  ),
  Movement(
    registroId: '1040',
    movementLabel: 'Baja de inventario',
    movementColor: AppColors.warning,
    movementBgColor: AppColors.warningTint,
    movementIcon: Icons.warning_amber_rounded,
    cantidadInvolucrada: -3,
    stockPrevio: 15,
    stockFinal: 12,
    fechaHora: '22/09/2025 • 11:32 AM',
    motivo: 'Producto dañado',
    codigoProducto: '119',
    productName: 'Marcador Permanente',
    sku: 'MAR-PER-01',
    category: 'Escritura',
    cantidadIngresada: 0,
    costoUnitario: 8.50,
    valorTotalLote: 25.50,
    esAlerta: true,
  ),
  Movement(
    registroId: '1039',
    movementLabel: 'Entrada',
    movementColor: AppColors.success,
    movementBgColor: AppColors.successTint,
    movementIcon: Icons.shopping_bag_outlined,
    cantidadInvolucrada: 50,
    stockPrevio: 30,
    stockFinal: 80,
    fechaHora: '20/09/2025 • 09:20 AM',
    motivo: 'Compra',
    codigoProducto: '104',
    productName: 'Goma de borrar Blanca',
    sku: 'GOM-BLA-01',
    category: 'Útiles',
    cantidadIngresada: 50,
    costoUnitario: 3.00,
    valorTotalLote: 150.00,
  ),
  Movement(
    registroId: '1038',
    movementLabel: 'Entrada',
    movementColor: AppColors.success,
    movementBgColor: AppColors.successTint,
    movementIcon: Icons.replay_outlined,
    cantidadInvolucrada: 7,
    stockPrevio: 8,
    stockFinal: 15,
    fechaHora: '16/09/2025 • 01:05 PM',
    motivo: 'Devolución',
    codigoProducto: '133',
    productName: 'Calculadora Científica',
    sku: 'CAL-CI-991',
    category: 'Útiles',
    cantidadIngresada: 7,
    costoUnitario: 250.00,
    valorTotalLote: 1750.00,
  ),
];