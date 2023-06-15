import 'package:flutter/material.dart';

import '../models/actors/actor.dart';
import 'actors_item.dart';

class ActorsList extends StatelessWidget {
  final List<Actor> actors;
  const ActorsList({
    Key? key,
    required this.actors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          return ActorsItem(actor: actors[index]);
        },
      ),
    );
  }
}
