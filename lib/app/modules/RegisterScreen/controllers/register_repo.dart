
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../config/api_route.dart';
import '../../../../config/share_pref.dart';
import '../../../../utils/dio_helper.dart';


class RegisterRepo {
  Dio dio = DioApi().sendRequest;
  final ApiRoute route = ApiRoute();

  Future<Response> getSignup(var data) async {
    try {
      Dio dio = DioApi().sendRequest;


      final response = await dio.post(route.signup, data: data );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
