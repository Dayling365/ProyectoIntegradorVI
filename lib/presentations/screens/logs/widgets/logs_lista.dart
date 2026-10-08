import 'package:flutter/material.dart'; 
import 'logs_item.dart'; 
import '../../../theme/app_colors.dart'; 
import '../../../theme/app_icons.dart'; 

class LogsLista extends StatelessWidget { 
  const LogsLista({super.key}); 

  @override 
  Widget build(BuildContext context) { 

    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.link, 
          iconBg: AppColors.link.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '10:45 AM', 
          subtitulo: 'Inicio de sesión exitoso', 
          etiqueta: 'Seguridad', 
          etiquetaColor: AppColors.link, 
          etiquetaBg: AppColors.link.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.warning, 
          iconColor: AppColors.error, 
          iconBg: AppColors.error.withOpacity(0.12), 
          titulo: 'Ana García', 
          hora: '09:12 AM', 
          subtitulo: 'Producto desactivado: El Quijote (Ed. Especial)', 
          etiqueta: 'Inventario', 
          etiquetaColor: AppColors.error, 
          etiquetaBg: AppColors.error.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.warning, 
          iconBg: AppColors.warning.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '08:30 AM', 
          subtitulo: 'Cambio de estado: Miguel Vargas', 
          etiqueta: 'Usuarios', 
          etiquetaColor: AppColors.success, 
          etiquetaBg: AppColors.success.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.link, 
          iconBg: AppColors.link.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '10:45 AM', 
          subtitulo: 'Inicio de sesión exitoso', 
          etiqueta: 'Seguridad', 
          etiquetaColor: AppColors.link, 
          etiquetaBg: AppColors.link.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.success, 
          iconBg: AppColors.success.withOpacity(0.12), 
          titulo: 'Ana García', 
          hora: '08:15 AM', 
          subtitulo: 'Producto actualizado: Cuaderno Universitario', 
          etiqueta: 'Inventario', 
          etiquetaColor: AppColors.success, 
          etiquetaBg: AppColors.success.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.link, 
          iconBg: AppColors.link.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '07:50 AM', 
          subtitulo: 'Nuevo proveedor registrado: Distribuidora Escolar', 
          etiqueta: 'Proveedores', 
          etiquetaColor: AppColors.link, 
          etiquetaBg: AppColors.link.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.warning, 
          iconColor: AppColors.warning, 
          iconBg: AppColors.warning.withOpacity(0.12), 
          titulo: 'Ana García', 
          hora: '07:25 AM', 
          subtitulo: 'Stock actualizado: Lápiz Grafito HB', 
          etiqueta: 'Inventario', 
          etiquetaColor: AppColors.warning, 
          etiquetaBg: AppColors.warning.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.success, 
          iconBg: AppColors.success.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '06:40 AM', 
          subtitulo: 'Nueva categoría registrada: Material Escolar', 
          etiqueta: 'Catálogos', 
          etiquetaColor: AppColors.success, 
          etiquetaBg: AppColors.success.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.warning, 
          iconColor: AppColors.error, 
          iconBg: AppColors.error.withOpacity(0.12), 
          titulo: 'Ana García', 
          hora: '06:15 AM', 
          subtitulo: 'Intento de inicio de sesión fallido', 
          etiqueta: 'Seguridad', 
          etiquetaColor: AppColors.error, 
          etiquetaBg: AppColors.error.withOpacity(0.1), 
        ), 

        LogItem( 
          icon: AppIcons.edit, 
          iconColor: AppColors.link, 
          iconBg: AppColors.link.withOpacity(0.12), 
          titulo: 'Don César Admin', 
          hora: '05:50 AM', 
          subtitulo: 'Compra registrada: CP-2026-088', 
          etiqueta: 'Compras', 
          etiquetaColor: AppColors.link, 
          etiquetaBg: AppColors.link.withOpacity(0.1), 
        ), 

        const SizedBox(height: 10), 
      ], 
    ); 
  } 
}

