import 'package:cards_notebook/domain/repositories/posts_repo.dart';
import 'package:dartz/dartz.dart';

import '../../app/error/failures.dart';
import '../entities/post.dart';

class GetAllPostsUseCase{
  final PostsRepo repo;

  GetAllPostsUseCase(this.repo);

  Future<Either<Failure,List<Post>>>  call()async{
    return await repo.getAllPosts();
  }

}