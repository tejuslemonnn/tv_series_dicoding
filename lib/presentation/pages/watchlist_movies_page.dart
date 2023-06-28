import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../common/utils.dart';
import '../bloc/movie_watchlist/movie_watchlist_bloc.dart';
import '../bloc/tv_series_watchlist/tv_series_watchlist_bloc.dart';
import '../widgets/movie_card_list.dart';
import '../widgets/tv_series_card.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  const WatchlistMoviesPage({super.key});

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<MovieWatchlistBloc>().add(MovieWatchlistGetEvent());
    context.read<TvSeriesWatchlistBloc>().add(TvSeriesWatchlistGetEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<MovieWatchlistBloc>().add(MovieWatchlistGetEvent());
    context.read<TvSeriesWatchlistBloc>().add(TvSeriesWatchlistGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie',
                style: kHeading6,
              ),
              const SizedBox(height: 8.0),
              BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
                builder: (context, state) {
                  if (state is MovieWatchlistLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MovieWatchlistLoaded) {
                    return Column(
                      children: [
                        state.movies.isEmpty
                            ? const Text(
                                'Empty',
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final movie = state.movies[index];
                                  return MovieCard(movie);
                                },
                                itemCount: state.movies.length,
                              ),
                      ],
                    );
                  }
                  if (state is MovieWatchlistError) {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.message),
                    );
                  }
                  return const Text('no data');
                },
              ),
              const SizedBox(height: 8.0),
              Text(
                'TV Series',
                style: kHeading6,
              ),
              const SizedBox(height: 8.0),
              BlocBuilder<TvSeriesWatchlistBloc, TvSeriesWatchlistState>(
                builder: (context, state) {
                  if (state is TvSeriesWatchlistLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is TvSeriesWatchlistLoaded) {
                    return Column(
                      children: [
                        state.tvSeriesList.isEmpty
                            ? const Text(
                                'Empty',
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final series = state.tvSeriesList[index];
                                  return TvSeriesCard(series);
                                },
                                itemCount: state.tvSeriesList.length,
                              ),
                      ],
                    );
                  }
                  if (state is TvSeriesWatchlistError) {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.message),
                    );
                  }

                  return const Text('no data');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
