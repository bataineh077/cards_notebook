import 'dart:async';

import 'package:cards_notebook/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../app/constants.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/use_cases/get_all_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final GetAllPostsUseCase getAllPosts;

  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit)async {

      if(event is GetAllPostsEvent){
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();

        emit(_mapFailureOrPostsState(failureOrPosts));

      }
      else if( event is RefreshPostsEvent){
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();

        emit(_mapFailureOrPostsState(failureOrPosts));


      }

    });
  }

  PostsState _mapFailureOrPostsState(Either<Failure, List<Post>> either){

   return either.fold(
            (failure) =>
          ErrorPostsState(message: _mapFailureToMessage(failure)),
            (posts) =>
          LoadedPostsState(posts: posts)
        );
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return Constants.SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return Constants.EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return Constants.OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
