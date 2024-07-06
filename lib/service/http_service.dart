import 'dart:convert';

import 'package:http/http.dart';

import '../Model/Post.dart';



class Network {
  static String BASE = "dummy.restapiexample.com/api/v1";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

/* Http Apis*/

  static String API_LIST = "/employee";
  static String API_CREATE = "/create";
  static String API_UPDATE = "/update/"; //{id}
  static String API_DELETE = "/delete/"; //{id}

/* Http Requests*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary!,
      'employee_age': post.employee_age.toString(),
      'profile_image': post.profile_image.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'id': post.id.toString(),
      'employee_name': post.employee_name.toString(),
      'employee_salary': post.employee_salary.toString(),
      'employee_age': post.employee_age.toString(),
      'profile_image': post.profile_image.toString(),
    });

    return params;
  }
}