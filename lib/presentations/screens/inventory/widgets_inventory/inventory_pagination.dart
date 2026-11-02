import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class InventoryPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const InventoryPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });
  
  List<int?> _visiblePages() {
    if (totalPages <= 5) {
      return List<int?>.generate(totalPages, (i) => i + 1);
    }
    final pages = <int>{1, totalPages, currentPage - 1, currentPage, currentPage + 1}
        .where((p) => p >= 1 && p <= totalPages)
        .toList()
      ..sort();

    final result = <int?>[];
    for (var i = 0; i < pages.length; i++) {
      if (i > 0 && pages[i] - pages[i - 1] > 1) result.add(null);
      result.add(pages[i]);
    }
    return result;
  }

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
            for (final p in _visiblePages())
              if (p == null)
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text('...'))
              else
                _pageButton(p),
            IconButton(
              onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        Text('Página $currentPage de $totalPages',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
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
          color: selected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Text('$page',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.white : AppColors.textPrimary)),
      ),
    );
  }
}