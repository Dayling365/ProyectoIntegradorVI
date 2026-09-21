import 'package:flutter/material.dart';

import '../../app_routes.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/report_metric_card.dart';
import 'widgets/report_ranking_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.report,
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE6FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.bar_chart_rounded, color: Color(0xFF1B2A5C), size: 20),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reportes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16233F),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Visualiza y analiza el rendimiento de tu negocio.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _periodChip('Hoy', selected: true),
                const SizedBox(width: 8),
                _periodChip('Semana', selected: false),
                const SizedBox(width: 8),
                _periodChip('Mes', selected: false),
                const SizedBox(width: 8),
                _periodChip('Trimestre', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
            children: [
              ReportMetricCard(
                icon: Icons.attach_money,
                iconColor: const Color(0xFF3B82F6),
                label: 'Monto total de ventas',
                value: '\$124,500.00',
                trendText: '+12.5% vs período anterior',
                trendColor: const Color(0xFF16A34A),
                sparklineColor: const Color(0xFF3B82F6),
                sparklineData: const [20, 22, 21, 25, 30, 28, 35, 40],
              ),
              ReportMetricCard(
                icon: Icons.inventory_2_outlined,
                iconColor: const Color(0xFFF59E0B),
                label: 'Unidades vendidas',
                value: '3,420',
                trendText: '+8.2% vs período anterior',
                trendColor: const Color(0xFF16A34A),
                sparklineColor: const Color(0xFFF59E0B),
                sparklineData: const [10, 12, 11, 14, 13, 15, 17, 18],
              ),
              ReportMetricCard(
                icon: Icons.receipt_long_outlined,
                iconColor: const Color(0xFF10B981),
                label: 'Ticket promedio',
                value: '\$36.40',
                trendText: '+5.1% vs período anterior',
                trendColor: const Color(0xFF16A34A),
                sparklineColor: const Color(0xFF10B981),
                sparklineData: const [30, 28, 31, 29, 33, 32, 34, 36],
              ),
              ReportMetricCard(
                icon: Icons.sell_outlined,
                iconColor: const Color(0xFFA855F7),
                label: 'Categorías activas',
                value: '6',
                trendText: '+1.7% vs período anterior',
                trendColor: const Color(0xFF16A34A),
                sparklineColor: const Color(0xFFA855F7),
                sparklineData: const [5, 6, 5, 6, 6, 6, 6, 6],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
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
                Row(
                  children: [
                    const Icon(Icons.bar_chart_rounded, color: Color(0xFF1B2A5C), size: 18),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: Text(
                        'Ventas por categoría',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    const Text(
                      'Ver detalle >',
                      style: TextStyle(color: Color(0xFF3B82F6), fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _categoryRow('Libros', 0.42, const Color(0xFF16233F)),
                const SizedBox(height: 10),
                _categoryRow('Útiles escolares', 0.26, const Color(0xFFF59E0B)),
                const SizedBox(height: 10),
                _categoryRow('Papelería', 0.18, const Color(0xFF3B82F6)),
                const SizedBox(height: 10),
                _categoryRow('Otros', 0.14, Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
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
                Row(
                  children: [
                    const Icon(Icons.show_chart_rounded, color: Color(0xFF1B2A5C), size: 18),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: Text(
                        'Ventas por mes',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Últimos 6 meses', style: TextStyle(fontSize: 10)),
                          SizedBox(width: 3),
                          Icon(Icons.keyboard_arrow_down, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$180k', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          Text('\$135k', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          Text('\$90k', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          Text('\$45k', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          Text('\$0', style: TextStyle(fontSize: 9, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: CustomPaint(
                          painter: _MonthlyChartPainter(
                            data: const [45, 55, 65, 72, 88, 124.5],
                            maxValue: 180,
                          ),
                          child: Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ene', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Text('Feb', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Text('Mar', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Text('Abr', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Text('May', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Text('Jun', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ReportRankingCard(
                  headerIcon: Icons.inventory_2_outlined,
                  title: 'Productos más vendidos',
                  items: const [
                    RankingItem(number: 1, title: 'Cuaderno Espiral', subtitle: '320 unid.', trailingText: '22%', trailingColor: Color(0xFF16233F)),
                    RankingItem(number: 2, title: 'Lápiz Grafito HB', subtitle: '280 unid.', trailingText: '19%', trailingColor: Color(0xFF16233F)),
                    RankingItem(number: 3, title: 'Goma de borrar', subtitle: '215 unid.', trailingText: '15%', trailingColor: Color(0xFF16233F)),
                    RankingItem(number: 4, title: 'Marcador Perm.', subtitle: '180 unid.', trailingText: '12%', trailingColor: Color(0xFF16233F)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ReportRankingCard(
                  headerIcon: Icons.sell_outlined,
                  title: 'Categorías con mayor crecimiento',
                  items: const [
                    RankingItem(icon: Icons.description_outlined, iconColor: Color(0xFF3B82F6), title: 'Papelería', trailingText: '+18.4%', trailingColor: Color(0xFF16A34A)),
                    RankingItem(icon: Icons.edit_outlined, iconColor: Color(0xFFF59E0B), title: 'Útiles escolares', trailingText: '+12.7%', trailingColor: Color(0xFF16A34A)),
                    RankingItem(icon: Icons.menu_book_outlined, iconColor: Color(0xFF16233F), title: 'Libros', trailingText: '+9.3%', trailingColor: Color(0xFF16A34A)),
                    RankingItem(icon: Icons.grid_view_rounded, iconColor: Color(0xFFA855F7), title: 'Otros', trailingText: '+6.8%', trailingColor: Color(0xFF16A34A)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _periodChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1B2A5C) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected ? const Color(0xFF1B2A5C) : const Color(0xFFD9D9D9),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 12,
            color: selected ? Colors.white : Colors.grey[600],
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryRow(String label, double percent, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 84,
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 7,
              backgroundColor: const Color(0xFFF2F2F2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 32,
          child: Text(
            '${(percent * 100).toInt()}%',
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _MonthlyChartPainter extends CustomPainter {
  final List<double> data;
  final double maxValue;

  _MonthlyChartPainter({required this.data, required this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF3B82F6)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF3B82F6).withOpacity(0.25),
          const Color(0xFF3B82F6).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final points = <Offset>[];
    for (int i = 0; i < data.length; i++) {
      final x = size.width * i / (data.length - 1);
      final y = size.height - (data[i] / maxValue) * size.height;
      points.add(Offset(x, y));
    }

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      linePath.lineTo(p.dx, p.dy);
    }

    final areaPath = Path.from(linePath)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    canvas.drawPath(areaPath, areaPaint);
    canvas.drawPath(linePath, linePaint);

    for (int i = 0; i < points.length; i++) {
      final isLast = i == points.length - 1;
      canvas.drawCircle(
        points[i],
        isLast ? 5 : 3.5,
        Paint()..color = const Color(0xFF3B82F6),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MonthlyChartPainter oldDelegate) => false;
}