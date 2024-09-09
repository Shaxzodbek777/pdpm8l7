import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/album.dart';
import '../model/photo.dart';

class AlbumPage extends StatelessWidget {
  static const String id = "album";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: BlocBuilder<PhotoBloc, List<Photo>>(
        builder: (context, photos) {
          if (photos.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  leading: Image.network(photo.thumbnailUrl),
                  title: Text(photo.title),
                  subtitle: Text('Album ID: ${photo.albumId}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}