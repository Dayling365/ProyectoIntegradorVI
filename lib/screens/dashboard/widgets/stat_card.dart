import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String trend;
  final bool isAlert;
  final List<double> sparklineData;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.trend,
    this.isAlert = false,
    this.sparklineData = const [3, 5, 4, 6, 5, 7, 6, 8, 7, 9],
  });

  @override
  Widget build(BuildContext context) {
    const Color danger = Color(0xFFDC2626);
    const Color success = Color(0xFF16A34A);
    const Color dangerSoft = Color(0xFFFEE2E2);
    const Color card = Colors.white;
    const Color border = Color(0xFFE5E7EB);
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    final Color trendColor = isAlert ? danger : success;
    final Color sparkColor = isAlert ? danger : iconColor;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isAlert ? dangerSoft : card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isAlert
              ? danger.withValues(alpha: 0.3)
              : border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            label,
            style: const TextStyle(
              color: textSecondary,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: const TextStyle(
              color: textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Icon(
                isAlert
                    ? Icons.trending_down
                    : Icons.trending_up,
                size: 14,
                color: trendColor,
              ),

              const SizedBox(width: 4),

              Text(
                trend,
                style: TextStyle(
                  color: trendColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CustomPaint(
                painter: _SparklinePainter(
                  data: sparklineData,
                  color: sparkColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color color;

  _SparklinePainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final double minVal = data.reduce((a, b) => a < b ? a : b);
    final double maxVal = data.reduce((a, b) => a > b ? a : b);
    final double range = (maxVal - minVal) == 0 ? 1 : (maxVal - minVal);

    final double dx = size.width / (data.length - 1);

    List<Offset> points = List.generate(data.length, (i) {
      final double x = i * dx;
      final double normalized = (data[i] - minVal) / range;
      final double y = size.height - (normalized * (size.height - 4)) - 2;
      return Offset(x, y);
    });

    final Paint linePaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Path path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final midX = (p0.dx + p1.dx) / 2;
      final midY = (p0.dy + p1.dy) / 2;
      path.quadraticBezierTo(p0.dx, p0.dy, midX, midY);
    }
    path.lineTo(points.last.dx, points.last.dy);

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.color != color;
  }
}