import 'package:flutter/material.dart';

class AlertPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int rangeStart;
  final int rangeEnd;
  final int totalAlerts;
  final ValueChanged<int> onPageChanged;

  const AlertPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.rangeStart,
    required this.rangeEnd,
    required this.totalAlerts,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
              icon: const Icon(Icons.chevron_left),
            ),
            for (var p = 1; p <= totalPages; p++) _pageButton(p),
            IconButton(
              onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        Text('Mostrando $rangeStart-$rangeEnd de $totalAlerts alertas activas',
            style: const TextStyle(fontSize: 12, color: Color(0xFF8A94A6))),
      ],
    );
  }

  Widget _pageButton(int page) {
    final selected = page == currentPage;
    return GestureDetector(
      onTap: () => onPageChanged(page),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1B2A5C) : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Text('$page',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: selected ? Colors.white : const Color(0xFF1A1F36))),
      ),
    );
  }
}