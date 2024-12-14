import 'package:rest_api_machine_test/model/products.dart';

class HomeViewState {
  List<Product> smartphones;
  bool loading;
  bool isError;
  String? errorMsg;
  HomeViewState({
    this.smartphones = const [],
    required this.loading,
    this.isError = false,
    this.errorMsg,
  });

  HomeViewState copyWith({
    List<Product>? mobiles,
    bool? isLoading,
    bool? error,
    String? message,
  }) =>
      HomeViewState(
        smartphones: mobiles ?? this.smartphones,
        loading: isLoading ?? this.loading,
        isError: error ?? this.isError,
        errorMsg: message ?? this.errorMsg,
      );
}
