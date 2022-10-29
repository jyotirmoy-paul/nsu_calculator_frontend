class Result {
  final double? result;
  final String? error;

  const Result({
    this.result,
    this.error,
  });

  static get generalError => const Result(
        error: 'Something went wrong!',
      );

  @override
  String toString() {
    return 'Result($result, $error)';
  }
}
