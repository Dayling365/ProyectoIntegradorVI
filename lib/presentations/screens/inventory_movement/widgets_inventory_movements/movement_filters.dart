import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';

class MovementFilters extends StatelessWidget {
  const MovementFilters({super.key});

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
                      decoration: const InputDecoration(
                        hintText: 'Buscar producto o movimiento...',
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
                  child: _filtro( 
                    Icons.calendar_today_outlined, '01/09/2025',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _filtro(
                    Icons.calendar_today_outlined, '30/09/2025',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _filtro(
                    Icons.swap_vert, 'Tipo mov.',
                    subtitulo: 'Todos',
                    arrow: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _filtro(
                    Icons.flag_outlined, 'Motivo',
                    subtitulo: 'Todos',
                    arrow: true,
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
      height: subtitulo != null ? 56 : 48,
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