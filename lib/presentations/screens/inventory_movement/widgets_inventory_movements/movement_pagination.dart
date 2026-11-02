import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const MovementPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  List<int?> _visiblePages() {
    if (totalPages <= 5) {
      return List.generate(totalPages, (index) => index + 1);
    }

    if (currentPage <= 3) {
      return [1, 2, 3, 4, null, totalPages];
    }

    if (currentPage >= totalPages - 2) {
      return [ 1, null, totalPages - 3, totalPages - 2, totalPages - 1, totalPages];
    }

    return [ 1, null, currentPage - 1, currentPage, currentPage + 1, null, totalPages];
  }

  @override
  Widget build(BuildContext context) {
    final safeTotalPages = totalPages < 1 ? 1 : totalPages;
    final safeCurrentPage = currentPage.clamp(1, safeTotalPages);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: safeCurrentPage > 1 ? () => onPageChanged(safeCurrentPage - 1) : null,
              icon: const Icon(Icons.chevron_left),
            ),
            ..._visiblePages().map((page) {
              if (page == null) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('...'),
                );
              }

              return _pageButton(page, safeCurrentPage);
            }),
            IconButton(
              onPressed: safeCurrentPage < safeTotalPages ? () => onPageChanged(safeCurrentPage + 1) : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        Text('Página $safeCurrentPage de $safeTotalPages', style: AppText.caption,),
      ],
    );
  }

  Widget _pageButton(int page, int safeCurrentPage) {
    final selected = page == safeCurrentPage;
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
          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
        ),
        child: Text('$page',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: selected ? AppColors.white : AppColors.textPrimary)),
      ),
    );
  }
}