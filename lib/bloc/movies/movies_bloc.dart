import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts/bloc/movies/movies_data_source.dart';
import 'package:yts/bloc/movies/movies_event.dart';
import 'package:yts/bloc/movies/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesDataSource moviesDataSource;

  MoviesBloc({required this.moviesDataSource}) : super(EmptyMoviesState()) {
    on<LoadMovies>((event, emit) =>  _loadMovies(event, emit));
  }

  void _loadMovies(LoadMovies event, Emitter<MoviesState> emit) async {

    try {
      emit(LoadingMoviesState());

      var movies = await moviesDataSource.getMovies();

      if (movies.status == "ok" && movies.data != null) {
        emit(SuccessMoviesState(movies.data?.movies));
      }

    } on DioError catch (e) {
      emit(ErrorMoviesState(e.message));
    }
  }
}
