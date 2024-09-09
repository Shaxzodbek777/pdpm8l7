import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentBloc {
  Stream<List<dynamic>> get comments => _commentsController.stream;

  final _commentsController = StreamController<List<dynamic>>();

  Future<void> fetchComments() async {
    final response = await http
        .get(Uri.parse('http://jsonplaceholder.typicode.com/posts/1/comments'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _commentsController.sink.add(data);
    } else {
      _commentsController.addError('Failed to load comments');
    }
  }

  void dispose() {
    _commentsController.close();
  }
}