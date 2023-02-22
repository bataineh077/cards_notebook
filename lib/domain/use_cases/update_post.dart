import 'package:cards_notebook/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../app/error/failures.dart';
import '../repositories/posts_repo.dart';

class UpdatePostUseCase{


  final PostsRepo repo;

  UpdatePostUseCase(this.repo);

  Future<Either<Failure,Unit>> call(Post post)async{
    return await repo.updatePost(post);
  }

}