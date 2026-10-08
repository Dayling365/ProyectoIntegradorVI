import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String nombre;
  final String precioTotal;
  final String categoria;
  final String desglose;

  const DetailItem({
    super.key,
    required this.nombre,
    required this.precioTotal,
    required this.categoria,
    required this.desglose,
  });

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,),
                    ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,),
                      decoration: BoxDecoration(color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        ),
                      child: Text(
                        categoria,
                        style: const TextStyle(
                          fontSize: 10,
                          color: textSecondary,),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      desglose,
                      style: const TextStyle(
                        fontSize: 11,
                        color: textSecondary,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            precioTotal,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textPrimary,),
          ),
        ],
      ),
    );
  }
}