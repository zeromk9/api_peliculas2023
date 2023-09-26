import 'package:flutter/material.dart';
import 'package:api_peliculas2023/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: 'home',
      routes: {
        //Diccionario de rutas
        'home': (_) =>
            const HomeScreen(), //No se usa el contexto por lo q se usa (_)
        'details': (_) => const DetailsScreen(),
      },
    );
  }
}
