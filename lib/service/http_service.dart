import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Post.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/";
  static String API_DELETE = "/api/v1/delete/";

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await http.post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await http.put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    return {};
  }

  static Map<String, dynamic> paramsCreate(Employee employee) {
    return {
      'name': employee.employeeName!,
      'salary': employee.employeeSalary,
      'age': employee.employeeAge,
    };
  }

  static Map<String, dynamic> paramsUpdate(Employee employee) {
    return {
      'name': employee.employeeName!,
      'salary': employee.employeeSalary,
      'age': employee.employeeAge,
    };
  }

  static List<Employee> parseEmployeeList(String response) {
    final empResponse = empResponseFromJson(response);
    return empResponse.data ?? [];
  }
}
