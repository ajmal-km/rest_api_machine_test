import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_machine_test/repository/home/home_view_remote_repository.dart';
import 'home_view_state.dart';

final homeViewModel = StateNotifierProvider<HomeViewModel, HomeViewState>(
    (ref) => HomeViewModel(homeViewRemoteRepository: ref.read(homeViewRepo)));

class HomeViewModel extends StateNotifier<HomeViewState> {
  final HomeViewRemoteRepository homeViewRemoteRepository;
  HomeViewModel({required this.homeViewRemoteRepository})
      : super(HomeViewState(loading: false));

  Future<void> getSmartPhones() async {
    try {
      state = state.copyWith(isLoading: true);
      final data = await homeViewRemoteRepository.fetchdata();
      if (data.error) {
        state = state.copyWith(
          error: data.error,
          message: data.errorMsg,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          mobiles: data.data,
          error: data.error,
          message: data.errorMsg,
          isLoading: false,
        );
      }
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
        error: true,
        message: "API call failed",
        isLoading: false,
      );
    }
  }
}
