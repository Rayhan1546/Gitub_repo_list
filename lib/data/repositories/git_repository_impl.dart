import 'package:github_repo_list/data/data_sources/local/drift/github_database/github_dao.dart';
import 'package:github_repo_list/data/data_sources/remote/git_api_service.dart';
import 'package:github_repo_list/data/mapper/git_repository_mapper.dart';
import 'package:github_repo_list/domain/entities/repository.dart';
import 'package:github_repo_list/domain/repositories/git_repository.dart';

class GitRepositoryImpl extends GitRepository {
  final GitApiService gitHubApiService;
  final GithubDao githubDao;

  GitRepositoryImpl({
    required this.gitHubApiService,
    required this.githubDao,
  });

  @override
  Future<List<Repository>> getGitRepositories() async {
    // final List<Repository> mockRepositories = [
    //   Repository(
    //     id: 1,
    //     name: "Flutter Starter",
    //     description: "A starter template for Flutter apps with clean architecture.",
    //     imgUrl: "https://picsum.photos/id/1011/400/300",
    //   ),
    //   Repository(
    //     id: 2,
    //     name: "GetX Boilerplate",
    //     description: "Boilerplate project using GetX for state management and DI.",
    //     imgUrl: "https://picsum.photos/id/1015/400/300",
    //   ),
    //   Repository(
    //     id: 3,
    //     name: "REST API Client",
    //     description: "A reusable REST API client built with Dio and interceptors.",
    //     imgUrl: "https://picsum.photos/id/1025/400/300",
    //   ),
    //   Repository(
    //     id: 4,
    //     name: "Firebase Auth Demo",
    //     description: "Authentication demo using Firebase phone and email login.",
    //     imgUrl: "https://picsum.photos/id/1035/400/300",
    //   ),
    //   Repository(
    //     id: 5,
    //     name: "Cognito OTP Login",
    //     description: "Passwordless phone authentication using AWS Cognito and OTP.",
    //     imgUrl: "https://picsum.photos/id/1043/400/300",
    //   ),
    //   Repository(
    //     id: 6,
    //     name: "UI Components Kit",
    //     description: "Reusable Flutter UI components with Material 3 support.",
    //     imgUrl: "https://picsum.photos/id/1050/400/300",
    //   ),
    // ];
    //
    // return mockRepositories;



    try {
      final repositories = await gitHubApiService.fetchRepositories();

      final List<Repository> repoList = GitRepositoryMapper.mapToResponse(
        repositories,
      );

      await githubDao.insertRepoList(repoList);

      return repoList;
    } catch (e) {
      final localData = await githubDao.getAllRepos();

      return GitRepositoryMapper.mapToDatabase(localData);
    }
  }
}
