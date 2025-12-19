import 'package:flutter/material.dart';
import 'package:github_repo_list/presentation/common/extension/build_for_ext.dart';
import 'package:github_repo_list/presentation/common/extension/context_ext.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/view_model/github_repo_view_model.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/widgets/repository_card.dart';

class RepoList extends StatelessWidget {
  const RepoList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.getViewModel<GithubRepoViewModel>();

    return viewModel.stateListener.buildFor(
      select: (state) => state.repoList,
      builder: (context, state) {
        return Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: state.repoList.length,
            itemBuilder: (context, index) {
              final repo = state.repoList[index];
              return RepositoryCard(repository: repo);
            },
          ),
        );
      },
    );
  }
}
