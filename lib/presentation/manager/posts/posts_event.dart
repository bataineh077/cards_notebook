

part of 'posts_bloc.dart';



abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class GetAllPostsEvent extends PostsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RefreshPostsEvent extends PostsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
