import 'dart:ffi';

import 'package:cards_notebook/app/error/exception.dart';
import 'package:cards_notebook/app/error/failures.dart';
import 'package:cards_notebook/data/models/post_model.dart';
import 'package:cards_notebook/domain/entities/post.dart';
import 'package:cards_notebook/domain/repositories/posts_repo.dart';
import 'package:dartz/dartz.dart';

import '../../app/network/network_info.dart';
import '../data_sources/post_local_data_source.dart';
import '../data_sources/post_remote_data_source.dart';

class PostRepoImpl implements PostsRepo{

  final PostRemoteDataSource remoteDataSource;

  final PostLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  PostRepoImpl({required this.remoteDataSource, required this.localDataSource , required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{

    if(await networkInfo.isConnected){
      try {
     final remotePosts =    await remoteDataSource.getAllPosts();
     localDataSource.cachePost(remotePosts);

     return Right(remotePosts);
      }
      on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try {

        final cachedPosts =  await localDataSource.getCachedPosts();

        return Right(cachedPosts);
      }

      on EmptyCacheException{
        return Left(EmptyCacheFailure());
      }


    }



  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post)async {
  /// the args post is type Post we must convert it to PostModel object
    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);

    return await _getMessage((){
      return  remoteDataSource.addPost(postModel);

    });
    }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async{


    return await _getMessage((){
      return  remoteDataSource.deletePost(id);

    });
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async{

    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);

    return await _getMessage((){
      return  remoteDataSource.updatePost(postModel);

    });

    // if(await networkInfo.isConnected) {
    //
    //   try{
    //     await remoteDataSource.updatePost(postModel);
    //
    //     return const Right(unit);
    //   }on ServerException{
    //     return Left(ServerFailure());
    //   }
    //
    //
    // }else{
    //   return Left(OfflineFailure());
    // }

  }

  Future<Either<Failure, Unit>> _getMessage(Func  func)async{


    if(await networkInfo.isConnected) {

      try{

      func();

        return const Right(unit);
      }on ServerException{
        return Left(ServerFailure());
      }


    }else{
      return Left(OfflineFailure());
    }

  }

}

typedef Future<Unit> Func();