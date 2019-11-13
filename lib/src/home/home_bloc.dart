import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dependency_injection/src/shared/models/post.dart';
import 'package:dependency_injection/src/shared/repositories/general_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  final GeneralApi api;
  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);
  Observable<List<Post>> get listOut => _listController.stream.asyncMap((v) => api.getPosts());
  Sink get listIn => _listController.sink;

  @override
   void dispose() {
     _listController.close();
   }

}