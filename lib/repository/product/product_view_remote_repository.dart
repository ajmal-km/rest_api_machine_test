import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_machine_test/constants/app_constants.dart';
import 'package:rest_api_machine_test/model/products.dart';
import 'package:rest_api_machine_test/repository/api_response.dart';

final productViewRepo = Provider<ProductViewRemoteRepository>(
    (ref) => ProductViewRemoteRepository());

class ProductViewRemoteRepository {
  Future<ApiResponse> getMobile(String id) async {
    final endpoint = "objects/$id";
    try {
      var res = await http.get(Uri.parse(AppConstants.baseUrl + endpoint));
      if (res.statusCode >= 200 && res.statusCode <= 299) {
        return ApiResponse(
          data: productFromJson(res.body),
          error: false,
          errorMsg: "",
        );
      } else {
        log(res.reasonPhrase.toString());
        return ApiResponse(
          data: "",
          error: true,
          errorMsg: "Something went wrong!",
        );
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse(
        data: "",
        error: true,
        errorMsg: "API call failed!",
      );
    }
  }
}
