// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/movie_detail/genre.dart';
import '../models/movie_detail/movie_detail.dart';
import '../service/api.dart';

class MovieScreen extends StatefulWidget {
  final int id;
  final String title;
  const MovieScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final String imgUrl = Constants.imgUrl;
  late MovieDetail movie;
  bool isLoading = false;

  void fetchData() {
    setState(() {
      isLoading = true;
    });
    Future<dynamic> response = Api().getMovieDetails(widget.id);
    response.then((value) {
      setState(() {
        movie = value;
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
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  '$imgUrl/w500${movie.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '$imgUrl/w200${movie.posterPath}',
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                right: 40,
                bottom: 20,
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 180, 220, 224),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 46,
                    )),
              ),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _mainInfo(movie.title.toString(), movie.genres),
                const SizedBox(height: 20),
                _generateDetail('Release Date: ',
                    movie.releaseDate.toString().replaceAll('-', '.')),
                _generateDetail(
                    'Average Rating: ', "${(movie.voteAverage! * 10).ceil()}%"),
                _generateDetail('Time: ', _durationToString(movie.runtime)),
                const SizedBox(height: 20),
                const Text('Description',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(movie.overview.toString()),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _mainInfo(String title, List<Genre>? genres) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        Text(_convertGenresToString(genres)),
      ],
    );
  }
}

String _convertGenresToString(List<Genre>? genres) {
  if (genres != null && genres.isNotEmpty) {
    return genres.map((e) => e.name).join(', ');
  }
  return "";
}

String _durationToString(int? minutes) {
  if (minutes != null) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
  return '';
}

Widget _generateDetail(String key, dynamic value) {
  return Row(
    children: [
      Text(
        key,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Text(
        value,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
      )
    ],
  );
}
