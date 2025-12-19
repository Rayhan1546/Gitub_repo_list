import 'package:flutter/cupertino.dart';
import 'package:github_repo_list/presentation/base/base_argument.dart';
import 'package:github_repo_list/presentation/base/base_state.dart';
import 'package:github_repo_list/presentation/base/base_state_holder.dart';

abstract class BaseViewModel<A extends BaseArgument, S extends BaseState> extends BaseStateHolder<S> {
  BaseViewModel(super.initialState);

  void onViewReady({A? argument}) {}

  @protected
  void navigateTo({
    required String routePath,
    required BaseArgument arguments,
    bool isReplace = false,
    bool isClearBackStack = false,
  }) {
    updateBaseState(NavigateState(
      routePath: routePath,
      arguments: arguments,
      isReplace: isReplace,
      isClearBackStack: isClearBackStack,
    ));
  }

  void onDispose() {
    disposeBaseState();
  }
}
