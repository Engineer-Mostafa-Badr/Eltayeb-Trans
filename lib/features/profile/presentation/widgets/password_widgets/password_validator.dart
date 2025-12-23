class PasswordValidator {
  static String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور الحالية';
    }
    return null;
  }

  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور الجديدة';
    }
    if (value.length < 8) {
      return 'كلمة المرور الجديدة يجب أن تكون 8 أحرف على الأقل';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? newPassword) {
    if (value == null || value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور الجديدة';
    }
    if (value != newPassword) {
      return 'كلمة المرور الجديدة وتأكيدها غير متطابقين';
    }
    return null;
  }

  static String? validateForm({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    final currentError = validateCurrentPassword(currentPassword);
    if (currentError != null) return currentError;

    final newError = validateNewPassword(newPassword);
    if (newError != null) return newError;

    final confirmError = validateConfirmPassword(confirmPassword, newPassword);
    if (confirmError != null) return confirmError;

    return null;
  }
}

