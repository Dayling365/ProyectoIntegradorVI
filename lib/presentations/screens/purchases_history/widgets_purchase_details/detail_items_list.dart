import 'package:flutter/material.dart';
import 'detail_item.dart';

class DetailItemsList extends StatelessWidget {
  final String codigo;

  const DetailItemsList({super.key, required this.codigo});

  List<DetailItem> get detalles {
    switch (codigo) {
      case 'Compra #CP-2026-088':
        return const [
          DetailItem(
            nombre: 'Caja Bolígrafos Faber-Castell 0.7mm (50 un.)',
            precioTotal: 'C\$3,200.00',
            categoria: 'Papelería',
            desglose: '4 cajas x C\$800.00',
          ),

          DetailItem(
            nombre: 'Resma Papel Bond 75g A4 (500 hojas)',
            precioTotal: 'C\$1,800.00',
            categoria: 'Hojas',
            desglose: '10 resmas x C\$180.00',
          ),

          DetailItem(
            nombre: 'Marcador Permanente Negro Caja (12 un.)',
            precioTotal: 'C\$1,450.00',
            categoria: 'Escritura',
            desglose: '5 cajas x C\$290.00',
          ),
        ];

      case 'Compra #CP-2026-087':
        return const [
          DetailItem(
            nombre: 'Cuaderno Universitario 100 Hojas',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '20 unidades x C\$60.00',
          ),

          DetailItem(
            nombre: 'Lápiz Grafito HB',
            precioTotal: 'C\$750.00',
            categoria: 'Escritura',
            desglose: '50 unidades x C\$15.00',
          ),

          DetailItem(
            nombre: 'Borrador Blanco Escolar',
            precioTotal: 'C\$450.00',
            categoria: 'Escritura',
            desglose: '30 unidades x C\$15.00',
          ),
        ];

      case 'Compra #CP-2026-086':
        return const [
          DetailItem(
            nombre: 'Diccionario Escolar Español',
            precioTotal: 'C\$2,500.00',
            categoria: 'Libros',
            desglose: '10 unidades x C\$250.00',
          ),

          DetailItem(
            nombre: 'Libro de Matemáticas',
            precioTotal: 'C\$3,600.00',
            categoria: 'Libros',
            desglose: '12 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Libro de Ciencias Naturales',
            precioTotal: 'C\$2,800.00',
            categoria: 'Libros',
            desglose: '10 unidades x C\$280.00',
          ),
        ];

      case 'Compra #CP-2026-085':
        return const [
          DetailItem(
            nombre: 'Resma Papel Bond Carta 75g',
            precioTotal: 'C\$1,080.00',
            categoria: 'Hojas',
            desglose: '6 resmas x C\$180.00',
          ),

          DetailItem(
            nombre: 'Carpeta Manila Tamaño Carta',
            precioTotal: 'C\$720.00',
            categoria: 'Organización',
            desglose: '60 unidades x C\$12.00',
          ),

          DetailItem(
            nombre: 'Papelera Plástica de Escritorio',
            precioTotal: 'C\$650.00',
            categoria: 'Oficina',
            desglose: '10 unidades x C\$65.00',
          ),

          DetailItem(
            nombre: 'Cinta Adhesiva Transparente',
            precioTotal: 'C\$800.00',
            categoria: 'Papelería',
            desglose: '20 unidades x C\$40.00',
          ),
        ];

      case 'Compra #CP-2026-084':
        return const [
          DetailItem(
            nombre: 'Cuaderno Profesional 200 Hojas',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '10 unidades x C\$120.00',
          ),

          DetailItem(
            nombre: 'Lapicero Azul Punto Fino',
            precioTotal: 'C\$480.00',
            categoria: 'Escritura',
            desglose: '40 unidades x C\$12.00',
          ),

          DetailItem(
            nombre: 'Corrector Líquido 20ml',
            precioTotal: 'C\$350.00',
            categoria: 'Escritura',
            desglose: '10 unidades x C\$35.00',
          ),

          DetailItem(
            nombre: 'Regla Plástica 30cm',
            precioTotal: 'C\$300.00',
            categoria: 'Escolar',
            desglose: '20 unidades x C\$15.00',
          ),

          DetailItem(
            nombre: 'Marcador para Pizarra',
            precioTotal: 'C\$450.00',
            categoria: 'Escritura',
            desglose: '10 unidades x C\$45.00',
          ),
        ];

      case 'Compra #CP-2026-083':
        return const [
          DetailItem(
            nombre: 'Caja de Lápices de Colores 24 Unidades',
            precioTotal: 'C\$1,500.00',
            categoria: 'Escolar',
            desglose: '10 cajas x C\$150.00',
          ),

          DetailItem(
            nombre: 'Crayones Jumbo 12 Colores',
            precioTotal: 'C\$1,200.00',
            categoria: 'Escolar',
            desglose: '10 cajas x C\$120.00',
          ),

          DetailItem(
            nombre: 'Pintura Escolar 6 Colores',
            precioTotal: 'C\$1,100.00',
            categoria: 'Arte',
            desglose: '10 cajas x C\$110.00',
          ),

          DetailItem(
            nombre: 'Cartulina de Colores',
            precioTotal: 'C\$800.00',
            categoria: 'Arte',
            desglose: '40 unidades x C\$20.00',
          ),

          DetailItem(
            nombre: 'Pegamento Escolar 120g',
            precioTotal: 'C\$1,000.00',
            categoria: 'Papelería',
            desglose: '20 unidades x C\$50.00',
          ),
        ];

      case 'Compra #CP-2026-082':
        return const [
          DetailItem(
            nombre: 'Archivador Tamaño Carta',
            precioTotal: 'C\$1,500.00',
            categoria: 'Organización',
            desglose: '10 unidades x C\$150.00',
          ),

          DetailItem(
            nombre: 'Separadores Plásticos',
            precioTotal: 'C\$720.00',
            categoria: 'Organización',
            desglose: '20 paquetes x C\$36.00',
          ),

          DetailItem(
            nombre: 'Grapadora Metálica',
            precioTotal: 'C\$850.00',
            categoria: 'Oficina',
            desglose: '10 unidades x C\$85.00',
          ),

          DetailItem(
            nombre: 'Caja de Grapas 5000 Unidades',
            precioTotal: 'C\$620.00',
            categoria: 'Oficina',
            desglose: '20 cajas x C\$31.00',
          ),

          DetailItem(
            nombre: 'Clips Metálicos Medianos',
            precioTotal: 'C\$600.00',
            categoria: 'Oficina',
            desglose: '20 cajas x C\$30.00',
          ),

          DetailItem(
            nombre: 'Perforadora de Dos Agujeros',
            precioTotal: 'C\$600.00',
            categoria: 'Oficina',
            desglose: '5 unidades x C\$120.00',
          ),
        ];

      case 'Compra #CP-2026-081':
        return const [
          DetailItem(
            nombre: 'Post-it Adhesivo 3x3',
            precioTotal: 'C\$600.00',
            categoria: 'Oficina',
            desglose: '20 paquetes x C\$30.00',
          ),

          DetailItem(
            nombre: 'Marcador Resaltador Amarillo',
            precioTotal: 'C\$450.00',
            categoria: 'Escritura',
            desglose: '15 unidades x C\$30.00',
          ),

          DetailItem(
            nombre: 'Lapicero Negro Punto Medio',
            precioTotal: 'C\$400.00',
            categoria: 'Escritura',
            desglose: '40 unidades x C\$10.00',
          ),

          DetailItem(
            nombre: 'Corrector de Cinta',
            precioTotal: 'C\$500.00',
            categoria: 'Escritura',
            desglose: '10 unidades x C\$50.00',
          ),
        ];

      case 'Compra #CP-2026-080':
        return const [
          DetailItem(
            nombre: 'Tóner Láser Negro Compatible',
            precioTotal: 'C\$3,200.00',
            categoria: 'Impresión',
            desglose: '4 unidades x C\$800.00',
          ),

          DetailItem(
            nombre: 'Cartucho de Tinta Color',
            precioTotal: 'C\$2,400.00',
            categoria: 'Impresión',
            desglose: '4 unidades x C\$600.00',
          ),

          DetailItem(
            nombre: 'Papel Fotográfico A4',
            precioTotal: 'C\$1,120.00',
            categoria: 'Impresión',
            desglose: '8 paquetes x C\$140.00',
          ),

          DetailItem(
            nombre: 'Cable USB para Impresora',
            precioTotal: 'C\$600.00',
            categoria: 'Accesorios',
            desglose: '5 unidades x C\$120.00',
          ),
        ];

      case 'Compra #CP-2026-079':
        return const [
          DetailItem(
            nombre: 'Cuaderno Cosido Universitario',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '15 unidades x C\$80.00',
          ),

          DetailItem(
            nombre: 'Agenda Ejecutiva',
            precioTotal: 'C\$900.00',
            categoria: 'Agendas',
            desglose: '10 unidades x C\$90.00',
          ),

          DetailItem(
            nombre: 'Calendario de Escritorio',
            precioTotal: 'C\$600.00',
            categoria: 'Oficina',
            desglose: '10 unidades x C\$60.00',
          ),

          DetailItem(
            nombre: 'Libreta de Notas',
            precioTotal: 'C\$900.00',
            categoria: 'Cuadernos',
            desglose: '15 unidades x C\$60.00',
          ),
        ];

      case 'Compra #CP-2026-078':
        return const [
          DetailItem(
            nombre: 'Papel Bond Oficio 75g',
            precioTotal: 'C\$900.00',
            categoria: 'Hojas',
            desglose: '5 resmas x C\$180.00',
          ),

          DetailItem(
            nombre: 'Carpeta Plástica con Broche',
            precioTotal: 'C\$500.00',
            categoria: 'Organización',
            desglose: '20 unidades x C\$25.00',
          ),

          DetailItem(
            nombre: 'Sobre Manila Tamaño Carta',
            precioTotal: 'C\$300.00',
            categoria: 'Papelería',
            desglose: '50 unidades x C\$6.00',
          ),

          DetailItem(
            nombre: 'Bolsa Plástica para Documentos',
            precioTotal: 'C\$400.00',
            categoria: 'Organización',
            desglose: '20 unidades x C\$20.00',
          ),
        ];

      case 'Compra #CP-2026-077':
        return const [
          DetailItem(
            nombre: 'Libro de Lengua y Literatura',
            precioTotal: 'C\$2,100.00',
            categoria: 'Libros',
            desglose: '7 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Libro de Historia de Nicaragua',
            precioTotal: 'C\$1,800.00',
            categoria: 'Libros',
            desglose: '6 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Libro de Geografía',
            precioTotal: 'C\$1,200.00',
            categoria: 'Libros',
            desglose: '5 unidades x C\$240.00',
          ),

          DetailItem(
            nombre: 'Libro de Inglés Básico',
            precioTotal: 'C\$980.00',
            categoria: 'Libros',
            desglose: '7 unidades x C\$140.00',
          ),
        ];

      case 'Compra #CP-2026-076':
        return const [
          DetailItem(
            nombre: 'Silla Plástica Escolar',
            precioTotal: 'C\$1,500.00',
            categoria: 'Mobiliario',
            desglose: '5 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Pizarra Acrílica 60x90cm',
            precioTotal: 'C\$1,200.00',
            categoria: 'Oficina',
            desglose: '3 unidades x C\$400.00',
          ),

          DetailItem(
            nombre: 'Borrador para Pizarra',
            precioTotal: 'C\$270.00',
            categoria: 'Oficina',
            desglose: '10 unidades x C\$27.00',
          ),

          DetailItem(
            nombre: 'Marcadores para Pizarra',
            precioTotal: 'C\$600.00',
            categoria: 'Escritura',
            desglose: '20 unidades x C\$30.00',
          ),

          DetailItem(
            nombre: 'Regla Metálica 30cm',
            precioTotal: 'C\$300.00',
            categoria: 'Escolar',
            desglose: '10 unidades x C\$30.00',
          ),

          DetailItem(
            nombre: 'Cinta de Embalaje',
            precioTotal: 'C\$600.00',
            categoria: 'Papelería',
            desglose: '20 unidades x C\$30.00',
          ),
        ];

      case 'Compra #CP-2026-075':
        return const [
          DetailItem(
            nombre: 'Lápiz de Colores 12 Unidades',
            precioTotal: 'C\$480.00',
            categoria: 'Escolar',
            desglose: '4 cajas x C\$120.00',
          ),

          DetailItem(
            nombre: 'Cuaderno Infantil 50 Hojas',
            precioTotal: 'C\$500.00',
            categoria: 'Cuadernos',
            desglose: '10 unidades x C\$50.00',
          ),

          DetailItem(
            nombre: 'Borrador de Colores',
            precioTotal: 'C\$300.00',
            categoria: 'Escolar',
            desglose: '20 unidades x C\$15.00',
          ),

          DetailItem(
            nombre: 'Tajador Plástico',
            precioTotal: 'C\$300.00',
            categoria: 'Escolar',
            desglose: '20 unidades x C\$15.00',
          ),
        ];

      case 'Compra #CP-2026-074':
        return const [
          DetailItem(
            nombre: 'Novela Juvenil',
            precioTotal: 'C\$2,400.00',
            categoria: 'Libros',
            desglose: '8 unidades x C\$300.00',
          ),

          DetailItem(
            nombre: 'Cuentos Infantiles Ilustrados',
            precioTotal: 'C\$1,800.00',
            categoria: 'Libros',
            desglose: '10 unidades x C\$180.00',
          ),

          DetailItem(
            nombre: 'Atlas Escolar Ilustrado',
            precioTotal: 'C\$1,200.00',
            categoria: 'Libros',
            desglose: '5 unidades x C\$240.00',
          ),

          DetailItem(
            nombre: 'Diccionario Inglés-Español',
            precioTotal: 'C\$1,350.00',
            categoria: 'Libros',
            desglose: '5 unidades x C\$270.00',
          ),

          DetailItem(
            nombre: 'Libro de Caligrafía',
            precioTotal: 'C\$1,500.00',
            categoria: 'Escolar',
            desglose: '10 unidades x C\$150.00',
          ),
        ];

      case 'Compra #CP-2026-073':
        return const [
          DetailItem(
            nombre: 'Resma Papel Bond A4',
            precioTotal: 'C\$1,080.00',
            categoria: 'Hojas',
            desglose: '6 resmas x C\$180.00',
          ),

          DetailItem(
            nombre: 'Cartulina Blanca',
            precioTotal: 'C\$400.00',
            categoria: 'Arte',
            desglose: '20 unidades x C\$20.00',
          ),

          DetailItem(
            nombre: 'Cartulina de Colores',
            precioTotal: 'C\$600.00',
            categoria: 'Arte',
            desglose: '30 unidades x C\$20.00',
          ),

          DetailItem(
            nombre: 'Papel Crepé',
            precioTotal: 'C\$400.00',
            categoria: 'Arte',
            desglose: '20 unidades x C\$20.00',
          ),

          DetailItem(
            nombre: 'Papel Construcción',
            precioTotal: 'C\$440.00',
            categoria: 'Arte',
            desglose: '20 paquetes x C\$22.00',
          ),

          DetailItem(
            nombre: 'Foami de Colores',
            precioTotal: 'C\$1,000.00',
            categoria: 'Arte',
            desglose: '20 unidades x C\$50.00',
          ),
        ];

      case 'Compra #CP-2026-072':
        return const [
          DetailItem(
            nombre: 'Tinta para Impresora Negra',
            precioTotal: 'C\$900.00',
            categoria: 'Impresión',
            desglose: '2 unidades x C\$450.00',
          ),

          DetailItem(
            nombre: 'Tinta para Impresora Cyan',
            precioTotal: 'C\$450.00',
            categoria: 'Impresión',
            desglose: '1 unidad x C\$450.00',
          ),

          DetailItem(
            nombre: 'Tinta para Impresora Magenta',
            precioTotal: 'C\$450.00',
            categoria: 'Impresión',
            desglose: '1 unidad x C\$450.00',
          ),

          DetailItem(
            nombre: 'Tinta para Impresora Amarilla',
            precioTotal: 'C\$450.00',
            categoria: 'Impresión',
            desglose: '1 unidad x C\$450.00',
          ),

          DetailItem(
            nombre: 'Papel Fotográfico Brillante',
            precioTotal: 'C\$210.00',
            categoria: 'Impresión',
            desglose: '1 paquete x C\$210.00',
          ),
        ];

      case 'Compra #CP-2026-071':
        return const [
          DetailItem(
            nombre: 'Cuaderno Universitario Cuadriculado',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '15 unidades x C\$80.00',
          ),

          DetailItem(
            nombre: 'Cuaderno Universitario Rayado',
            precioTotal: 'C\$1,200.00',
            categoria: 'Cuadernos',
            desglose: '15 unidades x C\$80.00',
          ),

          DetailItem(
            nombre: 'Lapiceros Azul, Negro y Rojo',
            precioTotal: 'C\$900.00',
            categoria: 'Escritura',
            desglose: '60 unidades x C\$15.00',
          ),

          DetailItem(
            nombre: 'Marcadores Permanentes',
            precioTotal: 'C\$800.00',
            categoria: 'Escritura',
            desglose: '20 unidades x C\$40.00',
          ),

          DetailItem(
            nombre: 'Resaltadores Fluorescentes',
            precioTotal: 'C\$800.00',
            categoria: 'Escritura',
            desglose: '20 unidades x C\$40.00',
          ),

          DetailItem(
            nombre: 'Corrector Líquido',
            precioTotal: 'C\$500.00',
            categoria: 'Escritura',
            desglose: '10 unidades x C\$50.00',
          ),

          DetailItem(
            nombre: 'Tajadores Metálicos',
            precioTotal: 'C\$500.00',
            categoria: 'Escolar',
            desglose: '10 unidades x C\$50.00',
          ),
        ];

      case 'Compra #CP-2026-070':
        return const [
          DetailItem(
            nombre: 'Archivador de Palanca',
            precioTotal: 'C\$1,200.00',
            categoria: 'Organización',
            desglose: '8 unidades x C\$150.00',
          ),

          DetailItem(
            nombre: 'Carpeta Plástica',
            precioTotal: 'C\$750.00',
            categoria: 'Organización',
            desglose: '30 unidades x C\$25.00',
          ),

          DetailItem(
            nombre: 'Separadores de Colores',
            precioTotal: 'C\$600.00',
            categoria: 'Organización',
            desglose: '20 paquetes x C\$30.00',
          ),

          DetailItem(
            nombre: 'Clips Metálicos',
            precioTotal: 'C\$400.00',
            categoria: 'Oficina',
            desglose: '20 cajas x C\$20.00',
          ),

          DetailItem(
            nombre: 'Grapas para Grapadora',
            precioTotal: 'C\$400.00',
            categoria: 'Oficina',
            desglose: '20 cajas x C\$20.00',
          ),

          DetailItem(
            nombre: 'Notas Adhesivas',
            precioTotal: 'C\$800.00',
            categoria: 'Oficina',
            desglose: '20 paquetes x C\$40.00',
          ),
        ];

      case 'Compra #CP-2026-069':
        return const [
          DetailItem(
            nombre: 'Libro de Lectura Infantil',
            precioTotal: 'C\$900.00',
            categoria: 'Libros',
            desglose: '6 unidades x C\$150.00',
          ),

          DetailItem(
            nombre: 'Libro de Actividades Escolares',
            precioTotal: 'C\$600.00',
            categoria: 'Libros',
            desglose: '5 unidades x C\$120.00',
          ),

          DetailItem(
            nombre: 'Cuento Infantil Ilustrado',
            precioTotal: 'C\$450.00',
            categoria: 'Libros',
            desglose: '5 unidades x C\$90.00',
          ),

          DetailItem(
            nombre: 'Diccionario Escolar',
            precioTotal: 'C\$480.00',
            categoria: 'Libros',
            desglose: '2 unidades x C\$240.00',
          ),

          DetailItem(
            nombre: 'Libro para Colorear',
            precioTotal: 'C\$300.00',
            categoria: 'Escolar',
            desglose: '5 unidades x C\$60.00',
          ),
        ];

      default:
        return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color textPrimary = Color(0xFF1A1F36);
    const Color textSecondary = Color(0xFF8A94A6);

    final items = detalles;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2_outlined, size: 16),
              const SizedBox(width: 8),
              const Text( 'Ítems recibidos / comprados',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const Spacer(),
              Text( '${items.length} líneas',
                style: const TextStyle(fontSize: 11, color: textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 14),
          ...items,
        ],
      ),
    );
  }
}

