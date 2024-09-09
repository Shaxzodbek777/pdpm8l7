import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadPostsEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeletePostEvent extends HomeEvent {
  final Post post;

  const DeletePostEvent({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}