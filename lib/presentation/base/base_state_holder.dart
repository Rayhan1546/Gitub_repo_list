import 'package:flutter/foundation.dart';
import 'package:github_repo_list/presentation/base/base_state.dart';

abstract class BaseStateHolder<S extends BaseState> {
  final _baseState = ValueNotifier<BaseState?>(null);
  final ValueNotifier<S> _state;

  ValueListenable<BaseState?> get baseState => _baseState;
  ValueListenable<S> get stateListener => _state;

  BaseStateHolder(S initialState) : _state = ValueNotifier(initialState);

  @protected
  S get currentState => _state.value;

  @protected
  void updateBaseState(BaseState? state) {
    _baseState.value = state;
  }

  @protected
  void updateState(S newState) {
    _state.value = newState;
  }

  void disposeBaseState() {
    _baseState.dispose();
    _state.dispose();
  }
}
