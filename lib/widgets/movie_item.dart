import 'package:fl_movie_finder/models/movie.dart';
import 'package:flutter/material.dart';

import '../screens/movie.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  final String imgUrl = "https://image.tmdb.org/t/p/w300";
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieScreen(id: movie.id!),
            ),
          );
        },
        child: Image.network(
            movie.posterPath != null
                ? '$imgUrl${movie.posterPath}'
                : 'https://joadre.com/wp-content/uploads/2019/02/no-image.jpg',
            fit: BoxFit.cover),
      ),
    );
  }
}
