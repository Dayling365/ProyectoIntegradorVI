import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class InventoryFilters extends StatelessWidget {
  final List<String> categories;
  final List<String> brands;
  final List<String> statuses;
  final List<String> sortOptions;

  final String category;
  final String brand;
  final String status;
  final String sortBy;

  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onBrandChanged;
  final ValueChanged<String> onStatusChanged;
  final ValueChanged<String> onSortChanged;
  final VoidCallback onClear;

  const InventoryFilters({
    super.key,
    required this.categories,
    required this.brands,
    required this.statuses,
    required this.sortOptions,
    required this.category,
    required this.brand,
    required this.status,
    required this.sortBy,
    required this.onCategoryChanged,
    required this.onBrandChanged,
    required this.onStatusChanged,
    required this.onSortChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _FilterDropdown(
                icon: Icons.category_outlined,
                label: 'Categoría',
                value: category,
                options: categories,
                onSelected: onCategoryChanged,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _FilterDropdown(
                icon: Icons.sell_outlined,
                label: 'Marca',
                value: brand,
                options: brands,
                onSelected: onBrandChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _FilterDropdown(
                icon: Icons.toggle_on_outlined,
                label: 'Estado',
                value: status,
                options: statuses,
                onSelected: onStatusChanged,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _FilterDropdown(
                icon: Icons.swap_vert, 
                label: 'Ordenar por',
                value: sortBy,
                options: sortOptions,
                onSelected: onSortChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: onClear,
            icon: const Icon(Icons.close, size: 16, color: AppColors.info),
            label: const Text(
              'Limpiar filtros',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.info),
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const _FilterDropdown({
    required this.icon,
    required this.label,
    required this.value,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      position: PopupMenuPosition.under,
      offset: const Offset(0, 4),
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: onSelected,
      itemBuilder: (context) => options.map((o) {
        final selected = o == value;
        return PopupMenuItem<String>(
          value: o,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  o,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? AppColors.primary : AppColors.textPrimary,
                  ),
                ),
              ),
              if (selected) const Icon(Icons.check, size: 16, color: AppColors.primary),
            ],
          ),
        );
      }).toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  Text(value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}