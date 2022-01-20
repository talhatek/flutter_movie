import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:yts/bloc/movies/movies_bloc.dart';
import 'package:yts/bloc/movies/movies_event.dart';
import 'package:yts/bloc/movies/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yts.ag Movies")),

      body:  const MoviesScreenBody(),
    );
  }

}

class MoviesScreenBody extends StatelessWidget {
  const MoviesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesBloc>(context).add(LoadMovies());
   // final logger = Logger();
    return BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context,state){
         // logger.i(state.toString());

          if(state is LoadingMoviesState){
            return const Center(child: Text('loading'));

          }
          else if (state is SuccessMoviesState){
            return  Center(child: Text('data came ${state.movies?.length.toString()}'));

          }
          else if (state is ErrorMoviesState){
            return Center(child: Text(state.errorMessage));

          }
          else {
            return const Center(child: Text(''));
          }
        }
    );
  }

}