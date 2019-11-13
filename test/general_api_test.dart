import 'package:dependency_injection/src/shared/models/post.dart';
import 'package:dependency_injection/src/shared/repositories/general_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  var api = GeneralApi();
  test("get posts", () async {
    List<Post> data = await api.getPosts();
    expect(data[0].id, 1);
  }, skip: true);
}