import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/src/redux/posts/posts_actions.dart';
import 'package:redux_example/src/redux/posts/posts_reducer.dart';
import 'package:redux_example/src/redux/posts/posts_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetPostStateAction) {
    final nextPostState = postReducer(state.postState, action);
    return state.copyWith(postState: nextPostState);
  }
  return state;
}

class AppState {
  final PostState postState;

  AppState({@required this.postState});
  AppState copyWith({PostState postState}) {
    return AppState(postState: postState ?? this.postState);
  }
}

class Redux {
  static Store<AppState> _store;
  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("Store is Not innitialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postStateInitial = PostState.initial();

    _store = Store<AppState>(appReducer,
        middleware: [thunkMiddleware],
        initialState: AppState(postState: postStateInitial));
  }
}
