import 'package:dartz/dartz.dart';
import '../../common/failure.dart';
import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;
  GetTvSeriesDetail({
    required this.repository,
  });

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
