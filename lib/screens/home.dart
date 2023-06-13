import 'package:fl_movie_finder/models/movie.dart';
import 'package:fl_movie_finder/service/api.dart';
import 'package:fl_movie_finder/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import '../models/response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> movies = [];
  bool showBtn = false;
  int page = 1;
  bool isLoading = false;

  void fetchData() {
    setState(() {
      isLoading = true;
    });
    Future<Response> response = Api().getTrendingMovies();
    response.then((value) {
      setState(() {
        movies = value.results;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          const Text('Trending Movies',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          if (movies.isNotEmpty) MovieList(movies: movies),
        ],
      ),
    );
  }
}
