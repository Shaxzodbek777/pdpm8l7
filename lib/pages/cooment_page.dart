import 'package:flutter/material.dart';

import '../bloc/comment.dart';
class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
  static const String id = "comment";
}

class _CommentPageState extends State<CommentPage> {
  late CommentBloc _commentBloc;

  @override
  void initState() {
    super.initState();
    _commentBloc = CommentBloc();
    _commentBloc.fetchComments();
  }

  @override
  void dispose() {
    _commentBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: StreamBuilder<List<dynamic>>(
        stream: _commentBloc.comments,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['name']),
                  subtitle: Text(snapshot.data?[index]['body']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}