import 'package:api_peliculas2023/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, //Sombra barra
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_off_outlined))
          ],
          title: const Center(child: Text('Peliculas en cine')),
        ),
        body: const Column(
          children: [CardSwiper(), MovieSlider()],
        ));
  }
}
