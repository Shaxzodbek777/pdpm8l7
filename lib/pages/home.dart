import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/create_bloc.dart';
import '../bloc/home_even.dart';
import '../bloc/home_state.dart';
import '../model/post.dart';
import '../veiw/item_off_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadPostsEvent());
    homeBloc.stream.listen((state) {
      if (state is HomeDeletePostState) {
        homeBloc.add(LoadPostsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeErrorState) {
          return viewOfError(state.errorMessage);
        }
        if (state is HomePostListState) {
          return viewOfPostList(state.posts);
        }
        return viewOfLoading();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc.callCreatePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget viewOfError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfPostList(List<Post> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          Post post = items[index];
          return itemOfPost(ctx, homeBloc, post);
        });
  }
}