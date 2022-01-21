import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts/bloc/movies/movies_data_source.dart';
import 'package:yts/bloc/movies/movies_event.dart';
import 'package:yts/bloc/movies/movies_state.dart';
import 'package:yts/data/movies/movie.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesDataSource moviesDataSource;
  int page = 1;
  int moviesCount = 0;
  bool isFetching = false;
  final List<Movie> movieList = [];
  bool isBottom = false;

  MoviesBloc({required this.moviesDataSource}) : super(EmptyMoviesState()) {
    on<LoadMovies>((event, emit) => _loadMovies(event, emit));
  }

  bool _isFetchable() {
    return moviesCount - movieList.length > 0;
  }

  void _loadMovies(LoadMovies event, Emitter<MoviesState> emit) async {
    log("load movies triggered");
    try {
      if (page == 1) {
        emit(InitialLoadingMoviesState());
      } else if (!_isFetchable()) {
        return;
      } else {
        emit(LoadingMoviesState());
      }

      var movies = await moviesDataSource.getMovies(page);

      if (movies.status == "ok" && movies.data != null) {
        page++;
        moviesCount = movies.data!.movieCount!;
        movieList.addAll(movies.data!.movies!);
        emit(SuccessMoviesState(movies.data?.movies));
      } else {
        isFetching = false;
      }
    } on DioError catch (e) {
      isFetching = false;
      emit(ErrorMoviesState(e.message));
    }
  }
}
