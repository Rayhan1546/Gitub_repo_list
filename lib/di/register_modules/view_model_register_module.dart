import 'package:github_repo_list/data/data_sources/local/app_config/login_state_manager.dart';
import 'package:github_repo_list/data/data_sources/local/app_config/token_manager.dart';
import 'package:github_repo_list/di/di_module/di_module.dart';
import 'package:github_repo_list/domain/use_cases/git_repo_use_case.dart';
import 'package:github_repo_list/presentation/feature/github_repo_page/view_model/github_repo_view_model.dart';
import 'package:github_repo_list/presentation/feature/login_page/view_model/login_view_model.dart';
import 'package:github_repo_list/presentation/feature/splash_page/view_model/splash_view_model.dart';
import 'package:github_repo_list/presentation/feature/counter_page/view_model/counter_view_model.dart';

///This class will always be factory
class ViewModelRegisterModule {
  final diModule = DIModule();

  Future<void> registerViewModels() async {
    final gitRepoUseCase = diModule.get<GitRepoUseCase>();
    final loginStateManager = diModule.get<LoginStateManager>();
    final tokenManager = diModule.get<TokenManager>();

    diModule.registerFactory<SplashViewModel>(SplashViewModel(
      loginStateManager: loginStateManager,
    ));

    diModule.registerFactory<LoginViewModel>(LoginViewModel(
      loginStateManager: loginStateManager,
      tokenManager: tokenManager,
    ));

    diModule.registerFactory<GithubRepoViewModel>(GithubRepoViewModel(
      gitRepoUseCase: gitRepoUseCase,
      tokenManager: tokenManager,
    ));
    diModule.registerFactory<CounterViewModel>(CounterViewModel());
  }
}
