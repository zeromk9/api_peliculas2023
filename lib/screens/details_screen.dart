import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla:
    //final String movie =
    ModalRoute.of(context)?.settings.toString() ?? 'Sin Nombre';
    return const Scaffold(
        body: CustomScrollView(
      //WIDGET CON COMPARTIMIENTOS
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          _PosterAndTitle(),
          _Overview(),
          _ActorSlider(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: true,
      pinned: true,
      //WIDGET PARA AJUSTAR TAMANO:
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //ELIMINAR EL PADDING
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text('movie.title'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/no-image.jpg'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: AssetImage('assets/no-image.jpg'),
                  height: 250,
                )),
            const SizedBox(width: 20),
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'movie.titleOriginal',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline_outlined,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'movie.voteAverage',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ))
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Non et adipisicing do cillum. Esse minim reprehenderit proident magna adipisicing cupidatat. Sint duis dolore cupidatat reprehenderit ea sint deserunt Lorem adipisicing culpa mollit occaecat labore amet. Nisi aute laboris commodo est commodo reprehenderit anim magna minim. Nostrud minim deserunt aliquip minim. Pariatur eiusmod cillum ad deserunt nulla eiusmod sint do incididunt nostrud.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class _ActorSlider extends StatelessWidget {
  const _ActorSlider();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.3,
        color: Colors.cyan,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Actores',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, int index) => const _ActorSlider(),
          ))
        ]));
  }
}
