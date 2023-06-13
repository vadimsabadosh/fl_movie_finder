import 'package:fl_movie_finder/models/movie.dart';
import 'package:flutter/material.dart';

import 'movie_item.dart';

class MovieList extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 5 / 9,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: movies.length,
          itemBuilder: (BuildContext ctx, index) {
            return MovieItem(movie: movies[index]);
          }),
    );
  }
}
