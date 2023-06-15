import 'actor.dart';

class Actors {
  List<Actor>? actors;

  Actors({this.actors});

  factory Actors.fromJson(Map<String, dynamic> json) => Actors(
        actors: (json['cast'] as List<dynamic>?)
            ?.map((e) => Actor.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
