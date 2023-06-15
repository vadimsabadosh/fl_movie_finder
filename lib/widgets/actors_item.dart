import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/actors/actor.dart';

class ActorsItem extends StatelessWidget {
  final String imgUrl = "${Constants.imgUrl}/w200";

  final Actor actor;
  ActorsItem({
    Key? key,
    required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
                actor.profilePath != null
                    ? '$imgUrl${actor.profilePath}'
                    : Constants.noImage,
                height: 180,
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
