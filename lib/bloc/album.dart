import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  Future<List<Photo>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

class PhotoBloc extends Cubit<List<Photo>> {
  final PhotoRepository repository;

  PhotoBloc(this.repository) : super([]);

  void fetchPhotos() async {
    try {
      final photos = await repository.fetchPhotos();
      emit(photos);
    } catch (e) {
      print(e);
    }
  }
}