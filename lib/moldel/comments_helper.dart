import 'package:api/moldel/comments.dart';
import 'package:http/http.dart' as http;


class CommentsHelper {
  Future<List<Comments>?> getComments() async {
    var respose = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );

    if (respose.statusCode == 200) {
      var json = respose.body;
      return commentsFromJson(json);
    }
  }
}
