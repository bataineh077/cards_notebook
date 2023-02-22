import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../app/constants.dart';
import '../../../app/error/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/use_cases/add_post.dart';
import '../../../domain/use_cases/delete_post.dart';
import '../../../domain/use_cases/update_post.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {

  final AddPostUseCase addPost;
  final DeletePostUseCase deletePost;
  final UpdatePostUseCase updatePost;




  AddDeleteUpdatePostBloc({required this.addPost,required this.deletePost,required this.updatePost}) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async{

      if(event is AddPostEvent){

        emit(LoadingAddDeleteUpdatePostState());

        final failureOrDoneMessage = await addPost(event.post);

        _eitherDoneMessageOrErrorState(failureOrDoneMessage , Constants.ADD_SUCCESS_MESSAGE);

      }else if(event is UpdatePostEvent){


        emit(LoadingAddDeleteUpdatePostState());

        final failureOrDoneMessage = await updatePost(event.post);

        _eitherDoneMessageOrErrorState(failureOrDoneMessage , Constants.UPDATE_SUCCESS_MESSAGE);


      }else if(event is DeletePostEvent){

        final failureOrDoneMessage = await deletePost(event.postId);

        _eitherDoneMessageOrErrorState(failureOrDoneMessage , Constants.DELETE_SUCCESS_MESSAGE);

      }
    });
  }

  AddDeleteUpdatePostState _eitherDoneMessageOrErrorState(Either<Failure, Unit> either,String message){

    return either.fold(
            (failure) =>
              ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure))
            ,
            (_) =>  MessageAddDeleteUpdatePostState(message: message));

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
