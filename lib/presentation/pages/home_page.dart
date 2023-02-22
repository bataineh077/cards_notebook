import 'package:cards_notebook/presentation/manager/posts/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/widgets/loading_widget.dart';
import '../widgets/message_display_widget.dart';
import '../widgets/post_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(),floatingActionButton: _buildFloatingBtn(),);
  }

Widget _buildFloatingBtn(){

    return FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),);
}

AppBar _buildAppBar() =>AppBar(title: Text("Posts"),);

Widget _buildBody(){
    return BlocBuilder<PostsBloc , PostsState>(
      builder: (context , state){
        if(state is LoadingPostsState){
          return LoadingWidget();
        }else if(state is LoadedPostsState){

          return PostListWidget(posts: state.posts,);

        }else if(state is ErrorPostsState){
          return MessageDisplayWidget(
              message: state.message
          );
        }
        return LoadingWidget();
      },
    );
}


}