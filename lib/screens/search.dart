import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../models/response.dart';
import '../service/api.dart';
import '../widgets/movie_list.dart';
import '../widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MovieModel> movies = [];
  bool isLoading = false;
  void onSubmit(String value) {
    setState(() {
      isLoading = true;
    });
    Future<Response> response = Api().getSearchMovies(value);
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        SearchBar(onSubmit: onSubmit),
        if (movies.isNotEmpty) MovieList(movies: movies),
      ],
    );
  }
}
