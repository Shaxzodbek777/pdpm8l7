import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePostListState extends HomeState {
  final List<Post> posts;

  HomePostListState(this.posts);

  @override
  // TODO: implement props
  List<Object?> get props => [posts];
}

class HomeDeletePostState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}