import 'package:flutter/material.dart';
import 'package:github_repo_list/presentation/common/extension/context_ext.dart';
import 'package:github_repo_list/presentation/feature/counter_page/view_model/counter_intent.dart';
import 'package:github_repo_list/presentation/feature/counter_page/view_model/counter_view_model.dart';


class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.getViewModel<CounterViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => viewModel.dispatchIntent(const IncrementIntent()),
          child: const Text('+1'),
        ),
        ElevatedButton(
          onPressed: () => viewModel.dispatchIntent(
            const CustomIncrementIntent(incrementNumber: 2),
          ),
          child: const Text('+2'),
        ),
        ElevatedButton(
          onPressed: () => viewModel.dispatchIntent(const DecrementIntent()),
          child: const Text('-1'),
        ),
        ElevatedButton(
          onPressed: () => viewModel.dispatchIntent(const ResetIntent()),
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
