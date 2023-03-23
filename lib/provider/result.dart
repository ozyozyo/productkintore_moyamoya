class Result<T> {
  final T? value;
  final String? errorMessage;

  Result.success(this.value) : errorMessage = null;

  Result.failure(this.errorMessage) : value = null;

  when(
      {required Function(dynamic v) success,
      required List Function(dynamic error) failure}) {
    if (errorMessage != null) {
      return failure(errorMessage);
    }
    return success(value);
  }
}
