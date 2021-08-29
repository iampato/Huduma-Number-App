import 'package:dio/dio.dart';
import 'package:huduma/models/huduma_response.dart';


class HudumaRepo {
  // get HTTP Huduma status
  Future<HudumaResponse> getHttpHudumaStatus({
    required String idNumber,
  }) async {
    try {
      var response = await Dio().post(
        'https://confirmation.hudumanamba.go.ke:32610/card/status',
        data: {"id_number": idNumber},
      );
      if (response.statusCode == 200) {
        HudumaResponse res = HudumaResponse.fromJson(response.data);
        return res;
      } else {
        throw Exception("An error occurred");
      }
    } catch (e) {
      throw e;
    }
  }
}
