import 'dart:convert';

import 'package:cards_notebook/app/error/exception.dart';
import 'package:cards_notebook/app/extentions.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';

abstract class PostLocalDataSource{


  Future<List<PostModel>> getCachedPosts();

  Future<Unit> cachePost(List<PostModel> postModels);

}

class PostLocalDataSourceImpl implements PostLocalDataSource{

  final SharedPreferences preferences ;


  PostLocalDataSourceImpl({required this.preferences});

  @override
  Future<Unit> cachePost(List<PostModel> postModels) {
    List postModelsToJson = postModels.map<Map<String,dynamic>>((postModel) => postModel.toJson()).toList();

    preferences.setString("CACHED_POSTS", json.encode(postModelsToJson));

    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {

    final jsonString = preferences.getString("CACHED_POSTS");

    if(jsonString!.isEmpty){

      List decodeJsonData = json.decode(jsonString);

      List<PostModel> jsonToPostModels = decodeJsonData.map((jsonPostModel) => PostModel.fromJson(jsonPostModel)).toList();

      return Future.value(jsonToPostModels);
    }
    else {
      throw EmptyCacheException();
    }
  }

}