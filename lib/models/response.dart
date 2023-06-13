import 'movie.dart';

class Response {
  final int totalPages;
  final int page;
  final List<MovieModel> results;

  const Response({
    required this.totalPages,
    required this.page,
    required this.results,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      totalPages: json['total_pages'],
      page: json['page'],
      results: List<MovieModel>.from(
          json["results"].map((x) => MovieModel.fromJson(x))),
    );
  }
}
