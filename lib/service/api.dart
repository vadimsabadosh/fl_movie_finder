import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/actors/actors.dart';
import '../models/movie_detail/movie_detail.dart';
import '../models/response.dart';

class Api {
  final String key = '2105b7aaa5e5e75ccc7797a3d78c360e';

  Future<Response> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=$key'));
      if (response.statusCode == 200) {
        return Response.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSearchMovies(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=$key&query=$query'));

      if (response.statusCode == 200) {
        return Response.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MovieDetail> getMovieDetails(int id) async {
    try {
      final response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/movie/$id?api_key=$key'));
      if (response.statusCode == 200) {
        return MovieDetail.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Actors> getMovieActors(int id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=$key'));

      if (response.statusCode == 200) {
        return Actors.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
