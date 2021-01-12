import 'package:flutter/foundation.dart';
import 'package:redux_example/src/models/i_post.dart';

@immutable
class PostState {
  final isError;
  final isLoading;
  final List<IPost> posts;

  PostState({
    this.isError,
    this.isLoading,
    this.posts,
  });
  factory PostState.initial() => PostState(
        isError: false,
        isLoading: false,
        posts: const [],
      );
  PostState copyWith(
      {@required bool isError,
      @required bool isLoading,
      @required List<IPost> posts}) {
    return PostState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }
}
