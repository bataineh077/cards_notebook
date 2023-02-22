import 'package:cards_notebook/app/network/network_info.dart';
import 'package:cards_notebook/data/data_sources/post_local_data_source.dart';
import 'package:cards_notebook/data/data_sources/post_remote_data_source.dart';
import 'package:cards_notebook/domain/repositories/posts_repo.dart';
import 'package:cards_notebook/domain/use_cases/add_post.dart';
import 'package:cards_notebook/domain/use_cases/delete_post.dart';
import 'package:cards_notebook/domain/use_cases/get_all_posts.dart';
import 'package:cards_notebook/domain/use_cases/update_post.dart';
import 'package:cards_notebook/presentation/manager/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:cards_notebook/presentation/manager/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'data/repositories/post_repo_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
final sl = GetIt.instance;

Future<void> init() async{

  ///Bloc

  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(addPost: sl(), deletePost: sl(), updatePost: sl()));

  ///UseCases

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));

  ///Repository

  sl.registerLazySingleton<PostsRepo>(() => PostRepoImpl(remoteDataSource: sl() , localDataSource: sl() ,networkInfo: sl() ));

/// DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceImpl(preferences: sl()));


 ///Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
///External

  final sharedPref = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() =>sharedPref);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}