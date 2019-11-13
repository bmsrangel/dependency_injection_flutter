import 'package:dependency_injection/src/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:dependency_injection/src/shared/models/post.dart';

class GeneralApi {
  // Instancia do DIO
  final Dio dio;
  GeneralApi(this.dio);

  // Construtor do repositório
  // GeneralApi() {
  //   dio = Dio();
  //   dio.options.baseUrl = URL_API;
  // }

  // Método para pegar os posts da aplicação
  Future<List<Post>> getPosts() async {
    Response response = await dio.get("/posts");
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }
}