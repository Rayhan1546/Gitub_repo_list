import 'package:flutter/material.dart';

class BaseProvider<T> extends InheritedWidget {
  final T viewModel;

  const BaseProvider._({
    super.key,
    required this.viewModel,
    required super.child,
  });

  BaseProvider({
    Key? key,
    required T viewModel,
    required Widget Function(BuildContext context, T viewModel) builder,
  }) : this._(
          key: key,
          viewModel: viewModel,
          child: Builder(
            builder: (context) => builder(context, viewModel),
          ),
        );

  static T read<T>(BuildContext context) {
    final provider = context.getInheritedWidgetOfExactType<BaseProvider<T>>();
    assert(provider != null, 'No BaseProvider<$T> found in context');
    return provider!.viewModel;
  }

  @override
  bool updateShouldNotify(BaseProvider<T> oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}
