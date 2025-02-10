import 'package:flutter/material.dart';
import 'package:movie_verse/common/widgets/appbar/app_bar.dart';
import 'package:movie_verse/domain/movie/entities/movie.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
    );
  }
}
