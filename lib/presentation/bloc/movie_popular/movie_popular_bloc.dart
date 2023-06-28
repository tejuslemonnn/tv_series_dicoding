import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMovies usecases;
  MoviePopularBloc(
    this.usecases,
  ) : super(MoviePopularInitial()) {
    on<MoviePopularGetEvent>((event, emit) async {
      emit(MoviePopularLoading());
      final result = await usecases.execute();
      result.fold(
        (l) => emit(MoviePopularError(message: l.message)),
        (r) => emit(MoviePopularLoaded(movies: r)),
      );
    });
  }
}
