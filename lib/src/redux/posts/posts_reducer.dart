import 'package:redux_example/src/redux/posts/posts_actions.dart';
import 'package:redux_example/src/redux/posts/posts_state.dart';

postReducer(PostState prevState, SetPostStateAction action) {
  final payload = action.postState;
  return prevState.copyWith(
      isError: payload.isError,
      isLoading: payload.isLoading,
      posts: payload.posts);
}
// postsReducer(PostState prevState, SetPostStateAction action) {
//   final payload = action.postState;
//   return prevState.copyWith(
//     isError: payload.isError,
//     isLoading: payload.isLoading,
//     posts: payload.posts,
//   );
// }
