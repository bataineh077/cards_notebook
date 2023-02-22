part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {
  @override
  List<Object> get props => [];
}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState{

  final String message ;

  const ErrorAddDeleteUpdatePostState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}

class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState{

  final String message ;

  const MessageAddDeleteUpdatePostState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}



