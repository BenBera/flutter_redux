import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';
import 'package:redux_example/src/models/i_post.dart';
import 'package:redux_example/src/redux/posts/posts_state.dart';
import 'package:http/http.dart' as http;
import 'package:redux_example/src/redux/store.dart';

@immutable
class SetPostStateAction {
  final PostState postState;

  SetPostStateAction(this.postState);
}

Future<void> fetchPostsAction(Store<AppState> store) async {
  store.dispatch(SetPostStateAction(PostState(
    isLoading: true,
  )));
  try {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(url);
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(SetPostStateAction(
        PostState(isLoading: false, posts: IPost.listFromJson(jsonData))));
  } catch (e) {
    store.dispatch(SetPostStateAction(PostState(isLoading: false)));
  }
}
