import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    return SafeArea(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color(0xFFF5F5F5),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              movie.mediumCoverImage ?? 'https://picsum.photos/seed/789/300',
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child:
                          Text(movie.title!, overflow: TextOverflow.ellipsis)),
                  RatingBarIndicator(
                    rating: movie.rating!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Text(movie.descriptionFull ?? "null",
                  maxLines: 5, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("Details"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
