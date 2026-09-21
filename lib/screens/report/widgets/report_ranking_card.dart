import 'package:flutter/material.dart';

class RankingItem {
  final int? number;
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String? subtitle;
  final String trailingText;
  final Color trailingColor;

  const RankingItem({
    this.number,
    this.icon,
    this.iconColor,
    required this.title,
    this.subtitle,
    required this.trailingText,
    required this.trailingColor,
  });
}

class ReportRankingCard extends StatelessWidget {
  final IconData headerIcon;
  final String title;
  final List<RankingItem> items;

  const ReportRankingCard({
    super.key,
    required this.headerIcon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado: ícono + título + "Ver todos >"
          Row(
            children: [
              Icon(headerIcon, color: const Color(0xFF1B2A5C), size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          const Text(
            'Ver todos >',
            style: TextStyle(color: Color(0xFF3B82F6), fontSize: 11),
          ),
          const SizedBox(height: 10),
          // Lista de items
          for (int i = 0; i < items.length; i++) ...[
            _rankingRow(items[i]),
            if (i != items.length - 1) const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Widget _rankingRow(RankingItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Numeral o ícono, según cuál venga
        if (item.number != null)
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${item.number}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          )
        else if (item.icon != null)
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: (item.iconColor ?? Colors.grey).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(item.icon, color: item.iconColor, size: 14),
          ),
        const SizedBox(width: 8),
        // Título (+ subtítulo si existe)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Color(0xFF16233F)),
              ),
              if (item.subtitle != null) ...[
                const SizedBox(height: 1),
                Text(
                  item.subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 5),
        // Porcentaje / tendencia a la derecha
        Text(
          item.trailingText,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: item.trailingColor,
          ),
        ),
      ],
    );
  }
}