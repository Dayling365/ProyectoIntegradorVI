import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'widgets/report_metric_card.dart';
import 'widgets/report_bar_chart.dart';
import 'widgets/report_category_donut.dart';
import 'widgets/report_ranking_card.dart';
import '../../widgets/app_scaffold.dart';
import '../../../core/constant/app_routes.dart';
import '../../theme/app_text_theme.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _selectedPeriodIndex = 1;
  final List<String> _periods = ['Hoy', 'Semana', 'Mes', 'Trimestre', 'Año'];

  int _selectedReportType = 0;
  final List<String> _reportTypes = ['Ventas', 'Compra', 'Inventario'];

  final List<String> _dayLabels = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
  final List<double> _dayValues = [3600, 4200, 3800, 5100, 6200, 7400, 3900];

  final List<CategorySlice> _categorySlices = const [
    CategorySlice(label: 'Papelería', percent: 42, amount: '11,970', color: AppColors.primary),
    CategorySlice(label: 'Útiles escolares', percent: 28, amount: '7,980', color: AppColors.accent),
    CategorySlice(label: 'Arte y manual.', percent: 18, amount: '5,130', color: AppColors.info),
    CategorySlice(label: 'Libros', percent: 8, amount: '2,280', color: AppColors.success),
    CategorySlice(label: 'Otros', percent: 4, amount: '1,140', color: AppColors.textMuted),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.report,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reportes',
              style: AppText.heading,
            ),
            const SizedBox(height: 4),
            const Text(
              'Analiza el comportamiento y toma mejores decisiones.',
              style: AppText.bodySecondary,
            ),
            const SizedBox(height: 16),

            _buildReportTypeMenu(),
            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: const [
                ReportMetricCard(
                  icon: Icons.trending_up,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.accentLight,
                  label: 'Ventas totales',
                  value: 'C\$28,500.00',
                ),
                ReportMetricCard(
                  icon: Icons.inventory_2_outlined,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.accentLight,
                  label: 'Unidades vendidas',
                  value: '842',
                ),
                ReportMetricCard(
                  icon: Icons.groups_outlined,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.accentLight,
                  label: 'Productos top',
                  value: '12',
                ),
                ReportMetricCard(
                  icon: Icons.description_outlined,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.accentLight,
                  label: 'Prom. u/venta',
                  value: '3.5',
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      const Text('Período', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_periods.length, (i) {
                        final isSelected = i == _selectedPeriodIndex;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedPeriodIndex = i),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.accent : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                _periods[i],
                                style: TextStyle(
                                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildFilterDropdown(Icons.category_outlined, 'Categoría', 'Todas')),
                const SizedBox(width: 12),
                Expanded(child: _buildFilterDropdown(Icons.inventory_2_outlined, 'Producto', 'Todos')),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.show_chart, size: 18, color: AppColors.accent),
                      const SizedBox(width: 6),
                      const Text('Ventas en el período',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ReportBarChart(
                    labels: _dayLabels,
                    values: _dayValues,
                    maxAxisValue: 8000,
                    highlightedIndex: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.pie_chart_outline, size: 18, color: AppColors.accent),
                      const SizedBox(width: 6),
                      const Text('Participación por categoría',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ReportCategoryDonut(
                    slices: _categorySlices,
                    centerValue: 'C\$28,500',
                    centerLabel: 'Total ventas',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.local_offer_outlined, size: 18, color: AppColors.accent),
                      const SizedBox(width: 6),
                      const Text('Productos más vendidos',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const ReportRankingCard(
                    rank: 1,
                    icon: Icons.menu_book_outlined,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.accentLight,
                    productName: 'Cuaderno Espiral A4',
                    value: 'C\$6,270',
                    percentLabel: '22%',
                    progress: 0.22,
                  ),
                  const ReportRankingCard(
                    rank: 2,
                    icon: Icons.edit_outlined,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.accentLight,
                    productName: 'Lápiz Grafito HB',
                    value: 'C\$5,415',
                    percentLabel: '19%',
                    progress: 0.19,
                  ),
                  const ReportRankingCard(
                    rank: 3,
                    icon: Icons.auto_fix_normal_outlined,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.accentLight,
                    productName: 'Goma de borrar',
                    value: 'C\$4,275',
                    percentLabel: '15%',
                    progress: 0.15,
                  ),
                  const ReportRankingCard(
                    rank: 4,
                    icon: Icons.border_color_outlined,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.accentLight,
                    productName: 'Marcador Permanente',
                    value: 'C\$3,420',
                    percentLabel: '12%',
                    progress: 0.12,
                  ),
                  const ReportRankingCard(
                    rank: 5,
                    icon: Icons.straighten_outlined,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.accentLight,
                    productName: 'Regla 30 cm',
                    value: 'C\$2,565',
                    percentLabel: '9%',
                    progress: 0.09,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportTypeMenu() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: List.generate(_reportTypes.length, (i) {
          final isSelected = i == _selectedReportType;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedReportType = i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _reportTypes[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterDropdown(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: AppColors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.micro),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.bodyStrong,
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}