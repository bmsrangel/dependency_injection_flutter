import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dependency_injection/src/home/home_bloc.dart';
import 'package:dependency_injection/src/shared/models/post.dart';
import 'package:dependency_injection/src/shared/repositories/general_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HomeBloc bloc;

  // @override
  // void initState() {
  //   super.initState();
  //   bloc = HomeBloc(GeneralApi());
  // }

  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }
  final bloc = BlocProvider.getBloc<HomeBloc>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inject"),
      ),
      body: StreamBuilder<List<Post>>(
        stream: bloc.listOut,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
          List<Post> posts = snapshot.data;
          return ListView.separated(
            itemCount: posts.length, 
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text(posts[index].title),);
            }, 

          );
        },
      ),
    );
  }
}