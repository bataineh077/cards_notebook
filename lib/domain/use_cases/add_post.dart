import 'package:dartz/dartz.dart';

import '../../app/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repo.dart';

class AddPostUseCase{

  final PostsRepo repo;

  AddPostUseCase(this.repo);

  Future<Either<Failure,Unit>> call(Post post)async{
    return await repo.addPost(post);
  }
}