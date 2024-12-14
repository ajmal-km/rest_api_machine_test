import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../repository/product/product_view_remote_repository.dart';
import 'product_view_state.dart';

final productViewModel =
    StateNotifierProvider<ProductViewModel, ProductViewState>((ref) =>
        ProductViewModel(
            productViewRemoteRepository: ref.read(productViewRepo)));

class ProductViewModel extends StateNotifier<ProductViewState> {
  final ProductViewRemoteRepository productViewRemoteRepository;

  ProductViewModel({required this.productViewRemoteRepository})
      : super(ProductViewState(loading: false));

  Future<void> getSmartPhone({required String id}) async {
    try {
      state = state.copyWith(isLoading: true);
      final mobileData = await productViewRemoteRepository.getMobile(id);
      if (mobileData.error) {
        state = state.copyWith(
          isError: mobileData.error,
          message: mobileData.errorMsg,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          phone: mobileData.data,
          isError: mobileData.error,
          isLoading: false,
        );
      }
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
        isError: true,
        message: "Something went wrong!",
        isLoading: false,
      );
    }
  }
}
