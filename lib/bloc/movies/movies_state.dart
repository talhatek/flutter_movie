import 'package:yts/data/movies/movie.dart';

abstract class MoviesState {
  const MoviesState();
}

class EmptyMoviesState extends MoviesState {}

class LoadingMoviesState extends MoviesState {}

class SuccessMoviesState extends MoviesState {
  final List<Movie>? movies;

  const SuccessMoviesState(this.movies);
}

class ErrorMoviesState extends MoviesState {
  final String errorMessage;

  const ErrorMoviesState(this.errorMessage);
}


