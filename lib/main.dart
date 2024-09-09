import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdpm8l7/pages/albom_pages.dart';
import 'package:pdpm8l7/pages/cooment_page.dart';
import 'package:pdpm8l7/pages/home.dart';

import 'bloc/create_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomePage(),
      ),
      routes: {
        CommentPage.id: (context) => CommentPage(),
        AlbumPage.id: (context) => AlbumPage()
      },
    );
  }
}