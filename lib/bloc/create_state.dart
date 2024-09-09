import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

@immutable
abstract class CreateState extends Equatable {}

class CreateInitialState extends CreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateLoadingState extends CreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateErrorState extends CreateState {
  final String errorMessage;

  CreateErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreatedPostListState extends CreateState {
  final List<Post> posts;

  CreatedPostListState(this.posts);

  @override
  // TODO: implement props
  List<Object?> get props => [posts];
}

class CreateDeletePostState extends CreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}