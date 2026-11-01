import 'package:flutter/material.dart';
import '../../../theme/app_text_theme.dart';

class DetailItem extends StatelessWidget {
  final String nombre;
  final String precioTotal;
  final String desglose;

  const DetailItem({
    super.key,
    required this.nombre,
    required this.precioTotal,
    required this.desglose,
  });

  @override
  Widget build(BuildContext context) {

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
                  style: AppText.bodyStrong,
                ),
                const SizedBox(height: 4),
                Text(
                  desglose,
                  style: AppText.micro,
                ),
              ],
            ),
          ),
          Text(
            precioTotal,
            style: AppText.bodyStrong,
          ),
        ],
      ),
    );
  }
}