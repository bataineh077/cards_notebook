import 'package:cards_notebook/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../app/error/failures.dart';

abstract class PostsRepo{

Future<Either<Failure,List<Post>>>  getAllPosts();
Future<Either<Failure,Unit>> deletePost(int id);
Future<Either<Failure,Unit>>  updatePost(Post post);
Future<Either<Failure,Unit>> addPost(Post post);

}