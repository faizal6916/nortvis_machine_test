import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nortvis/dishes_list/view_models/dishes_view_model.dart';

import '../models/dishes_model.dart';
import './api_status.dart';

class DishServices {
  static Future<Object?> getDishes() async {
    try {
      var url = Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(response: dishesFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 102, errorResponse: 'Unknown Error');
    }
  }
}
