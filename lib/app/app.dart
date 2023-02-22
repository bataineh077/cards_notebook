import 'package:cards_notebook/presentation/manager/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../injection_container.dart' as di;

import '../presentation/manager/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp(){
  return  _instance;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.genRoute,
        initialRoute: Routes.homeRoute,
        theme: getApplicationTheme(),),
    );
  }
}

