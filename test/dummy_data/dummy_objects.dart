import 'package:tv_series_dicoding/data/models/movie_table.dart';
import 'package:tv_series_dicoding/data/models/tv_series_table.dart';
import 'package:tv_series_dicoding/domain/entities/genre.dart';
import 'package:tv_series_dicoding/domain/entities/movie.dart';
import 'package:tv_series_dicoding/domain/entities/movie_detail.dart';
import 'package:tv_series_dicoding/domain/entities/tv_series.dart';
import 'package:tv_series_dicoding/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvSeriesDetail = TvSeriesDetail(
  genres: [Genre(id: 1, name: 'Action')],
  id: 66732,
  name: "Stranger Things",
  numberOfEpisodes: 34,
  numberOfSeasons: 4,
  overview: "Stranger Things",
  posterPath: "/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
  voteAverage: 8.6,
);

final testTvSeries = TvSeries(
  name: "fdsfas",
  firstAirDate: "123",
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  originCountry: ['213', '33'],
  originalLanguage: "ID",
  originalName: "fdfasda",
  voteAverage: 7.2,
  voteCount: 13507,
);

final testTvSeriesList = [testTvSeries];

final testTvSeriesTable = TvSeriesTable(
  id: 111,
  name: "the last of ...",
  posterPath: "gambar.jpg",
  overview: "bagus",
);

final testTvSeriesMap = {
  'id': 111,
  'overview': 'bagus',
  'posterPath': 'gambar.jpg',
  'title': 'the last of ...',
};

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 111,
  name: "the last of ...",
  posterPath: "gambar.jpg",
  overview: "bagus",
);
