import 'package:flutter/material.dart';
import 'package:github_repo_list/di/di_module/di_module.dart';
import 'package:github_repo_list/presentation/base/base_argument.dart';
import 'package:github_repo_list/presentation/base/base_provider.dart';
import 'package:github_repo_list/presentation/base/base_state.dart';
import 'package:github_repo_list/presentation/base/base_view_model.dart';
import 'package:github_repo_list/presentation/navigation/app_router.dart';

abstract class BaseAdaptiveScreen<VM extends BaseViewModel, A extends BaseArgument> extends StatefulWidget {
  final A? arguments;

  const BaseAdaptiveScreen({super.key, required this.arguments});

  @protected
  Widget buildView(BuildContext context);

  @override
  State<BaseAdaptiveScreen<VM, A>> createState() =>
      _BaseAdaptiveScreenState<VM, A>();
}

class _BaseAdaptiveScreenState<VM extends BaseViewModel, A extends BaseArgument> extends State<BaseAdaptiveScreen<VM, A>> {
  late final A? _arguments;
  late final VM _viewModel;
  final diModule = DIModule();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _viewModel = diModule.get<VM>();
    _arguments = widget.arguments;
    _onViewReady();
    _setupListener();
  }

  @protected
  void _onViewReady() {
    _viewModel.onViewReady(argument: _arguments);
  }

  void _setupListener() {
    _viewModel.baseState.addListener(
      () {
        final baseState = _viewModel.baseState.value;
        if (!mounted) {
          return;
        }
        if (baseState is NavigateState) {
          _navigateTo(
            routePath: baseState.routePath,
            arguments: baseState.arguments,
            isReplace: baseState.isReplace,
            isClearBackStack: baseState.isClearBackStack,
          );
        }
      },
    );
  }

  void _navigateTo({
    required String routePath,
    required BaseArgument arguments,
    required bool isReplace,
    required bool isClearBackStack,
  }) async {
    if (isReplace) {
      await AppRouter.replaceTo(
        context: context,
        routePath: routePath,
        arguments: arguments,
      );
    } else if (isClearBackStack) {
      await AppRouter.clearStackAndGo(
        context: context,
        routePath: routePath,
        arguments: arguments,
      );
    } else {
      await AppRouter.navigateTo(
        context: context,
        routePath: routePath,
        arguments: arguments,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseProvider(
      viewModel: _viewModel,
      builder: (context, viewModel) {
        return widget.buildView(context);
      },
    );
  }

  @override
  void dispose() {
    _viewModel.onDispose();
    diModule.disposeViewModel<VM>();
    super.dispose();
  }
}
