import 'package:fl_movie_finder/constants/constants.dart';
import 'package:fl_movie_finder/models/movie.dart';
import 'package:flutter/material.dart';

import '../screens/movie.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  final String imgUrl = "${Constants.imgUrl}/w300";
  MovieItem({
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
              builder: (context) =>
                  MovieScreen(id: movie.id!, title: movie.title!),
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
