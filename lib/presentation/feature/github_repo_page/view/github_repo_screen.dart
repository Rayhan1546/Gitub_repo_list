import 'package:flutter/material.dart';
import 'package:github_repo_list/presentation/base/base_adaptive_screen.dart';
import 'package:github_repo_list/presentation/common/extension/build_for_ext.dart';
import 'package:github_repo_list/presentation/common/extension/context_ext.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/argument/github_repo_params.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/components/repo_list.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/components/repo_shimmer.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/view_model/github_repo_view_model.dart';

class GithubRepoScreen
    extends BaseAdaptiveScreen<GithubRepoViewModel, GithubRepoArgument> {
  const GithubRepoScreen({super.key, required super.arguments});

  @override
  Widget buildView(BuildContext context) {
    final viewModel = context.getViewModel<GithubRepoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repo List'),
      ),
      body: viewModel.stateListener.buildFor(
        select: (state) => state.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const RepoShimmer();
          }

          return RefreshIndicator(
            onRefresh: () async {
              return viewModel.onRefresh();
            },
            child: const RepoList(),
          );
        },
      ),
    );
  }
}
