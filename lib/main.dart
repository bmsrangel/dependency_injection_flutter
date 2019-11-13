import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dependency_injection/src/home/home_bloc.dart';
import 'package:dependency_injection/src/home/home_page.dart';
import 'package:dependency_injection/src/shared/repositories/client_http.dart';
import 'package:dependency_injection/src/shared/repositories/general_api.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
        title: 'Inject',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
    return BlocProvider(
          child: app,
          dependencies: [
            Dependency((i) => CustomDio(), singleton: true),
            Dependency((i) => GeneralApi(i.get<CustomDio>().getClient())),
          ],
          blocs: [
            Bloc((i) => HomeBloc(i.get<GeneralApi>()))
          ],
    );
  }
}
