import 'package:github_repo_list/presentation/feature/github_repo_page/argument/github_repo_params.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/view/github_repo_screen.dart';
import 'package:github_repo_list/presentation/feature/login_page/argument/login_arguments.dart';
import 'package:github_repo_list/presentation/feature/login_page/view/login_screen.dart';
import 'package:github_repo_list/presentation/feature/splash_page/argument/splash_argument.dart';
import 'package:github_repo_list/presentation/feature/splash_page/view/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:github_repo_list/presentation/feature/counter_page/argument/counter_argument.dart';
import 'package:github_repo_list/presentation/feature/counter_page/view/counter_screen.dart';

abstract class RoutePaths {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String githubRepoPage = '/githubRepoPage';
  static const String counter = '/counter';
}

final GoRouter routerConfig = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return SplashScreen(arguments: SplashArgument());
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) {
        final arguments = state.extra as LoginArgument;
        return LoginScreen(arguments: arguments);
      },
    ),
    GoRoute(
      path: RoutePaths.githubRepoPage,
      builder: (context, state) {
        final arguments = state.extra as GithubRepoArgument;
        return GithubRepoScreen(arguments: arguments);
      },
    ),
    GoRoute(
      path: RoutePaths.counter,
      builder: (context, state) {
        return CounterScreen(arguments: CounterArgument());
      },
    ),
  ],
);
