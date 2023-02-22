import 'package:dartz/dartz.dart';

import '../../app/error/failures.dart';
import '../repositories/posts_repo.dart';

class DeletePostUseCase{

  final PostsRepo repo;

  DeletePostUseCase(this.repo);

  Future<Either<Failure,Unit>> call(int postId)async{
    return await repo.deletePost(postId);
  }

}