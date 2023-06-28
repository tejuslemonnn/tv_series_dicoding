import 'package:tv_series_dicoding/data/datasources/db/database_helper.dart';
import 'package:tv_series_dicoding/data/datasources/movie_local_data_source.dart';
import 'package:tv_series_dicoding/data/datasources/movie_remote_data_source.dart';
import 'package:tv_series_dicoding/data/datasources/tv_series_local_data_source.dart';
import 'package:tv_series_dicoding/data/datasources/tv_series_remote_data_source.dart';
import 'package:tv_series_dicoding/domain/repositories/movie_repository.dart';
import 'package:tv_series_dicoding/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  TvSeriesRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
