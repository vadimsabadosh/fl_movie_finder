// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final int id;
  const MovieScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoviePage'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Center(child: Text('MoviePage $id')),
      ),
    );
  }
}
