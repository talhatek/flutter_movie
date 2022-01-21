import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts/bloc/movies/movies_bloc.dart';
import 'package:yts/bloc/movies/movies_event.dart';
import 'package:yts/bloc/movies/movies_state.dart';
import 'package:yts/data/movies/movie.dart';
import 'dart:developer';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yts.ag Movies")),
      body: const MoviesScreenBody(),
    );
  }
}

class MoviesScreenBody extends StatefulWidget {
  const MoviesScreenBody({Key? key}) : super(key: key);

  @override
  State<MoviesScreenBody> createState() => _MoviesScreenBody();
}

class _MoviesScreenBody extends State<MoviesScreenBody> {
  ScrollController? _controller;

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent &&
        !_controller!.position.outOfRange) {
      if (!BlocProvider.of<MoviesBloc>(context).isFetching) {
        BlocProvider.of<MoviesBloc>(context).isFetching = true;
        BlocProvider.of<MoviesBloc>(context).add(LoadMovies());
      }
    }
    if (_controller!.offset <= _controller!.position.minScrollExtent &&
        !_controller!.position.outOfRange) {}
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MoviesBloc>(context);
    log("build generated");
    bloc.add(LoadMovies());
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      //logger.i(state.toString());
      if (state is InitialLoadingMoviesState) {
        return const Center(child: Text('loading'));
      } else if (state is SuccessMoviesState) {
        bloc.isFetching = false;
        return ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) {
              if (index < bloc.movieList.length) {
                return MovieItem(
                    movie: bloc.movieList.elementAt(index), id: index);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: bloc.movieList.length + (bloc.isFetching ? 1 : 0));
      } else if (state is LoadingMoviesState) {
        return ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) {
              if (index < bloc.movieList.length) {
                return MovieItem(
                    movie: bloc.movieList.elementAt(index), id: index);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  _controller!.jumpTo(_controller!.position.maxScrollExtent);
                });
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: bloc.movieList.length + 1);
      } else if (state is ErrorMoviesState) {
        return Center(child: Text(state.errorMessage));
      } else {
        return const Center(child: Text(''));
      }
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.removeListener(_scrollListener);
    _controller!.dispose();
    super.dispose();
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  final int id;

  const MovieItem({Key? key, required this.movie, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(id.toString()),
            Text(movie.title!),
            const Padding(padding: EdgeInsets.all(4)),
            Text(movie.rating.toString()),
            const Padding(padding: EdgeInsets.all(4)),
            Text(movie.descriptionFull ?? "Null",
                maxLines: 3, overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}
