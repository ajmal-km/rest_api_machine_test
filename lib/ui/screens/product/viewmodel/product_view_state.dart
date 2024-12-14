import 'package:rest_api_machine_test/model/products.dart';

class ProductViewState {
  Product? mobile;
  bool loading;
  bool error;
  String? errorMsg;
  ProductViewState({
    this.mobile,
    required this.loading,
    this.error = false,
    this.errorMsg,
  });

  ProductViewState copyWith({
    Product? phone,
    bool? isLoading,
    bool? isError,
    String? message,
  }) =>
      ProductViewState(
        mobile: phone ?? this.mobile,
        loading: isLoading ?? this.loading,
        error: isError ?? this.error,
        errorMsg: message ?? this.errorMsg,
      );
}
