import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  final String _language = 'es-MX';

  MoviesProvider() {
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {'api_key': _apiKey, 'language': _language, 'page': '1'},
    );

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData);
    print(response.body);
  }
}
