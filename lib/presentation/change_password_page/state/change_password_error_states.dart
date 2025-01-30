import 'package:github_repo_list/presentation/common/validation/password_validator.dart';
import 'package:github_repo_list/presentation/common/validation/validation_error.dart';

class ChangePasswordErrorStates {
  final ValidationError? oldPasswordErrorText;
  final ValidationError? newPasswordErrorText;
  final ValidationError? confirmNewPasswordErrorText;

  ChangePasswordErrorStates({
    this.oldPasswordErrorText,
    this.newPasswordErrorText,
    this.confirmNewPasswordErrorText,
  });

  factory ChangePasswordErrorStates.initial() {
    return ChangePasswordErrorStates(
      oldPasswordErrorText: null,
      newPasswordErrorText: null,
      confirmNewPasswordErrorText: null,
    );
  }

  ChangePasswordErrorStates copyWith({
    ValidationError? Function()? oldPasswordErrorText,
    ValidationError? Function()? newPasswordErrorText,
    ValidationError? Function()? confirmNewPasswordErrorText,
  }) {
    return ChangePasswordErrorStates(
      oldPasswordErrorText: oldPasswordErrorText != null
          ? oldPasswordErrorText()
          : this.oldPasswordErrorText,
      newPasswordErrorText: newPasswordErrorText != null
          ? newPasswordErrorText()
          : this.newPasswordErrorText,
      confirmNewPasswordErrorText: confirmNewPasswordErrorText != null
          ? confirmNewPasswordErrorText()
          : this.confirmNewPasswordErrorText,
    );
  }

  ChangePasswordErrorStates validateOldPassword(String? password) {
    if (password == null || password.isEmpty) {
      return copyWith(
        oldPasswordErrorText: () {
          return PasswordValidator.getValidationError(password);
        },
      );
    }
    return copyWith(
      oldPasswordErrorText: () => null,
    );
  }

  ChangePasswordErrorStates validateNewPassword(String? password) {
    final state = copyWith(
      newPasswordErrorText: () {
        return PasswordValidator.getValidationError(password);
      },
    );

    return state;
  }

  ChangePasswordErrorStates validateConfirmPassword(
    String? newPassword,
    String? confirmNewPassword,
  ) {
    return copyWith(
      confirmNewPasswordErrorText: () {
        return PasswordValidator.matchTwoPassword(
          newPassword,
          confirmNewPassword,
        );
      },
    );
  }
}
