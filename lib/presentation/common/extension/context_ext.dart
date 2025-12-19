import 'package:flutter/material.dart';
import 'package:github_repo_list/presentation/base/base_provider.dart';

extension ViewModelContext on BuildContext {
  T getViewModel<T>() {
    return BaseProvider.read<T>(this);
  }
}
