import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_r/app/data/models/gathering_model.dart';
import 'package:test_r/app/data/sources/api_urls.dart';
import 'package:test_r/core/resources/data_state.dart';

class GatheringSource {
  final _dio = GetIt.I.get<Dio>();
  Future<DataState<List<GatheringModel>>> getGatheringList() async {
    Response<dynamic>? response;
    try {
      response = await _dio.get(ApiUrls.GET_LIST);

      if (response.statusCode == 200) {
        List<GatheringModel> list = [];
        for (var item in response.data['cards']) {
          list.add(GatheringModel.fromJson(item));
        }
        return DataSuccess(list);
      } else {
        debugPrint("response: ${response.statusCode}");
        return DataFailed(DioException(
          error: response.statusCode,
          response: response,
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: ApiUrls.GET_LIST),
        ));
      }
    } on DioException catch (e) {
      return DataFailed(DioException(
        error: e.toString(),
        response: response,
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: ApiUrls.GET_LIST),
      ));
    }
  }
}
