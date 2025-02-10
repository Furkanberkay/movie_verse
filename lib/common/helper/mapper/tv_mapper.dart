import 'package:movie_verse/data/tv/models/tv.dart';
import 'package:movie_verse/domain/tv/entities/tv.dart';

class TVMapper {
  static TVEntity toEntity(TVModel tvmodel) {
    return TVEntity(
        adult: tvmodel.adult,
        backdropPath: tvmodel.backdropPath,
        genreIds: tvmodel.genreIds,
        id: tvmodel.id,
        originCountry: tvmodel.originCountry,
        originalLanguage: tvmodel.originalLanguage,
        originalName: tvmodel.originalName,
        overview: tvmodel.overview,
        popularity: tvmodel.popularity,
        posterPath: tvmodel.posterPath,
        firstAirDate: tvmodel.firstAirDate,
        name:tvmodel. name,
        voteAverage: tvmodel.voteAverage,
        voteCount: tvmodel.voteCount
    );
  }
}