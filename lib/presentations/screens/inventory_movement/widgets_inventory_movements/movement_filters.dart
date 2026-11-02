import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementFilters extends StatefulWidget {
  final String initialSearch;
  final DateTime? startDate;
  final DateTime? endDate;
  final String selectedType;
  final String selectedSort;

  final ValueChanged<String> onSearchChanged;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;
  final ValueChanged<String> onTypeChanged;
  final ValueChanged<String> onSortChanged;

  const MovementFilters({
    super.key,
    this.initialSearch = '',
    this.startDate,
    this.endDate,
    this.selectedType = 'Todos',
    this.selectedSort = 'newest',
    required this.onSearchChanged,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onTypeChanged,
    required this.onSortChanged,
  });

  @override
  State<MovementFilters> createState() => _MovementFiltersState();
}

class _MovementFiltersState extends State<MovementFilters> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date, String fallback) {
    if (date == null) return fallback;

    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _pickDate(bool isStart) async {
    final selectedDate = isStart ? widget.startDate : widget.endDate;

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked == null || !mounted) return;

    if (isStart && widget.endDate != null && picked.isAfter(widget.endDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'La fecha inicial no puede ser posterior a la fecha final.',
          ),
        ),
      );
      return;
    }

    if (!isStart &&
        widget.startDate != null &&
        picked.isBefore(widget.startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'La fecha final no puede ser anterior a la fecha inicial.',
          ),
        ),
      );
      return;
    }

    if (isStart) {
      widget.onStartDateChanged(picked);
    } else {
      widget.onEndDateChanged(picked);
    }
  }

  String _sortLabel() {
    return widget.selectedSort == 'oldest'
        ? 'Más antiguas'
        : 'Más recientes';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration( color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.borderLight,
                ),
              ),
              child: Row(
                children: [
                  const Icon( Icons.search, size: 17, color: AppColors.primary,),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: widget.onSearchChanged,
                      decoration: const InputDecoration(
                        hintText: 'Buscar movimiento',
                        hintStyle: AppText.caption,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(true),
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      _formatDate(widget.startDate, 'Fecha inicial'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(false),
                    child: _filtro(
                      Icons.calendar_today_outlined,
                      _formatDate(widget.endDate, 'Fecha final'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: widget.onTypeChanged,
                    itemBuilder: (context) => const [
                      PopupMenuItem<String>(
                        value: 'Todos',
                        child: Text('Todos', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'Entrada',
                        child: Text('Entrada', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'Salida',
                        child: Text('Salida', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'Baja',
                        child: Text('Baja', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'Ajuste',
                        child: Text('Ajuste', style: AppText.body),
                      ),
                    ],
                    child: _filtro(
                      Icons.swap_vert,
                      'Tipo mov.',
                      subtitulo: widget.selectedType,
                      arrow: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: widget.onSortChanged,
                    itemBuilder: (context) => const [
                      PopupMenuItem<String>(
                        value: 'newest',
                        child: Text('Más recientes', style: AppText.body),
                      ),
                      PopupMenuItem<String>(
                        value: 'oldest',
                        child: Text('Más antiguas', style: AppText.body),
                      ),
                    ],
                    child: _filtro(
                      Icons.swap_vert,
                      'Ordenar por',
                      subtitulo: _sortLabel(),
                      arrow: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _filtro(
    IconData icon,
    String texto, {
    String? subtitulo,
    bool arrow = false,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon, size: 17,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: subtitulo == null
                ? Text(
                    texto,
                    style: AppText.captionPrimary,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        texto,
                        style: AppText.captionPrimary,
                      ),
                      Text(
                        subtitulo,
                        style: AppText.micro,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
          if (arrow)
            const Icon(
              Icons.keyboard_arrow_down, size: 16,
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }
}