import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    // Devuelve un contenedor con propiedades específicas
    return Container(
      width: double.infinity, // Ocupa todo el ancho de la pantalla
      height:
          size.height * 0.5, // Altura es la mitad de la altura de la pantalla
      color: Colors.amber, // Color de fondo del contenedor

      // Dentro del contenedor, se utiliza el widget Swiper
      child: Swiper(
        itemCount: 10, // Número total de elementos en el Swiper
        layout: SwiperLayout.STACK, // Diseño de apilamiento para las tarjetas
        itemWidth: size.width *
            0.6, // Ancho de cada tarjeta es el 60% del ancho de la pantalla
        itemHeight: size.height *
            0.4, // Altura de cada tarjeta es el 40% de la altura de la pantalla

        // Función que construye cada tarjeta
        itemBuilder: (_, int index) {
          return GestureDetector(
            // Detecta gestos, como tocar la tarjeta
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: ''), // Navega a una ruta llamada 'details'
            child: ClipRRect(
              // Recorta las esquinas de la tarjeta
              borderRadius:
                  BorderRadius.circular(20), // Radio de borde redondeado
              child: const FadeInImage(
                // Imagen con efecto de aparición gradual
                placeholder: AssetImage(
                    'assets/no-image.jpg'), // Imagen de carga hasta que se carga la real
                image: NetworkImage(
                    'https://via.placeholder.com/300x400'), // Imagen real desde una URL
              ),
            ),
          );
        },
      ),
    );
  }
}
