import 'package:fl_movie_finder/screens/movie.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MovieScreen(id: 1),
              ),
            );
          },
          child: const Text('Go to song 2'),
        ),
      ),
    );
  }
}
