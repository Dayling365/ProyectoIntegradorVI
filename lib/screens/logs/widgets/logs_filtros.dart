import 'package:flutter/material.dart'; 
import '../../../theme/app_colors.dart'; 
import '../../../theme/app_icons.dart'; 

class LogsFiltros extends StatelessWidget { 
  const LogsFiltros({super.key}); 

  @override 
  Widget build(BuildContext context) { 

    return Container( 
      width: double.infinity, 
      margin: const EdgeInsets.symmetric(horizontal: 4), 
      child: Padding( 
        padding: const EdgeInsets.all(4), 
        child: Column( 
          children: [ 
            Row( 
              children: [ 
                Expanded( 
                  child: _filtro( 
                    AppIcons.calendar, 
                    '01/10/2026', 
                  ), 
                ), 
                const SizedBox(width: 8), 
                Expanded( 
                  child: _filtro( 
                    AppIcons.calendar, 
                    '31/10/2026', 
                  ), 
                ), 
              ], 
            ), 

            const SizedBox(height: 8), 

            Row( 
              children: [ 
                Expanded( 
                  child: _filtro( 
                    AppIcons.person, 
                    'Usuario', 
                    subtitulo: 'Todos', 
                    arrow: true, 
                  ), 
                ), 
                const SizedBox(width: 8), 
                Expanded( 
                  child: _filtro( 
                    Icons.grid_view_outlined, 
                    'Módulo', 
                    subtitulo: 'Todos', 
                    arrow: true, 
                  ), 
                ), 
              ], 
            ), 

            const SizedBox(height: 8), 

            Row( 
              children: [ 
                Expanded( 
                  child: _filtro( 
                    Icons.toggle_off_outlined, 
                    'Estado', 
                    subtitulo: 'Todos', 
                    arrow: true, 
                  ), 
                ), 
                const SizedBox(width: 8), 
                Expanded( 
                  child: _filtro( 
                    AppIcons.movement, 
                    'Ordenar por', 
                    subtitulo: 'Más recientes', 
                    arrow: true, 
                  ), 
                ), 
              ], 
            ), 

            const SizedBox(height: 16), 

            Align( 
              alignment: Alignment.centerRight, 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.end, 
                children: [ 
                  Icon( 
                    Icons.close, 
                    size: 16, 
                    color: AppColors.link, 
                  ), 
                  const SizedBox(width: 4), 
                  Text( 
                    'Limpiar filtros', 
                    style: TextStyle( 
                      color: AppColors.link, 
                      fontSize: 13, 
                      fontWeight: FontWeight.w600, 
                    ), 
                  ), 
                ], 
              ), 
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
            icon, 
            size: 17, 
            color: AppColors.primary, 
          ), 
          const SizedBox(width: 8), 
          Expanded( 
            child: subtitulo == null 
                ? Text( 
                    texto, 
                    style: TextStyle( 
                      color: AppColors.primary, 
                      fontSize: 12, 
                      fontWeight: FontWeight.w600, 
                    ), 
                  ) 
                : Column( 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [ 
                      Text( 
                        texto, 
                        style: TextStyle( 
                          color: AppColors.primary, 
                          fontSize: 12, 
                          fontWeight: FontWeight.w600, 
                        ), 
                      ), 
                      Text( 
                        subtitulo, 
                        style: TextStyle( 
                          color: AppColors.textSecondary, 
                          fontSize: 10, 
                        ), 
                      ), 
                    ], 
                  ), 
          ), 
          if (arrow) 
            Icon( 
              Icons.keyboard_arrow_down, 
              size: 16, 
              color: AppColors.textSecondary, 
            ), 
        ], 
      ), 
    ); 
  } 
}

