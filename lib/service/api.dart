import 'dart:convert';
import 'package:http/http.dart' as http;

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
          'https://api.themoviedb.org/3/search/movie?api_key=$key&query=query'));

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

  Future<Response> getMovieCredits(int id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=$key'));

      if (response.statusCode == 200) {
        return Response.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getMovieReviews(int id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/reviews?api_key=$key'));

      if (response.statusCode == 200) {
        return Response.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

// export const getTrendingMovies = async () => {
//   const data = await axios.get(
//     `https://api.themoviedb.org/3/trending/movie/day?api_key=2105b7aaa5e5e75ccc7797a3d78c360e&access_token=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTA1YjdhYWE1ZTVlNzVjY2M3Nzk3YTNkNzhjMzYwZSIsInN1YiI6IjY0ODQ0ZGZkZDJiMjA5MDBjYTFmMGNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9I-Q5JNBmL7uanr9Yy2cXFJKfT8QdxGP3W3Xd1CZ0XA`
//   );
//   return data;
// };
// // Поиск
// export const getSearchMovies = async query => {
//   const data = await axios.get(
//     `https://api.themoviedb.org/3/search/movie?api_key=2105b7aaa5e5e75ccc7797a3d78c360e&access_token=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTA1YjdhYWE1ZTVlNzVjY2M3Nzk3YTNkNzhjMzYwZSIsInN1YiI6IjY0ODQ0ZGZkZDJiMjA5MDBjYTFmMGNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9I-Q5JNBmL7uanr9Yy2cXFJKfT8QdxGP3W3Xd1CZ0XA&query=${query}`
//   );
//   return data;
// };

// // Инфо фильм
// export const getDetailsMovies = async movie_id => {
//   const data = await axios.get(
//     `https://api.themoviedb.org/3/movie/${movie_id}?api_key=2105b7aaa5e5e75ccc7797a3d78c360e&access_token=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTA1YjdhYWE1ZTVlNzVjY2M3Nzk3YTNkNzhjMzYwZSIsInN1YiI6IjY0ODQ0ZGZkZDJiMjA5MDBjYTFmMGNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9I-Q5JNBmL7uanr9Yy2cXFJKfT8QdxGP3W3Xd1CZ0XA`
//   );
//   return data;
// };

// // Актёры
// export const getCreditsMovies = async movie_id => {
//   const data = await axios.get(
//     `https://api.themoviedb.org/3/movie/${movie_id}/credits?api_key=2105b7aaa5e5e75ccc7797a3d78c360e&access_token=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTA1YjdhYWE1ZTVlNzVjY2M3Nzk3YTNkNzhjMzYwZSIsInN1YiI6IjY0ODQ0ZGZkZDJiMjA5MDBjYTFmMGNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9I-Q5JNBmL7uanr9Yy2cXFJKfT8QdxGP3W3Xd1CZ0XA`
//   );
//   return data;
// };
// // Обзоры
// export const getReviewsMovies = async movie_id => {
//   const data = await axios.get(
//     `https://api.themoviedb.org/3/movie/${movie_id}/reviews?api_key=2105b7aaa5e5e75ccc7797a3d78c360e&access_token=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTA1YjdhYWE1ZTVlNzVjY2M3Nzk3YTNkNzhjMzYwZSIsInN1YiI6IjY0ODQ0ZGZkZDJiMjA5MDBjYTFmMGNhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9I-Q5JNBmL7uanr9Yy2cXFJKfT8QdxGP3W3Xd1CZ0XA`
//   );
//   return data;
// };
