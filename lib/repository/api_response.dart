class ApiResponse<T> {
  final T data;
  final bool error;
  final String errorMsg;

  ApiResponse({
    required this.data,
    required this.error,
    required this.errorMsg,
  });
}
