import 'dart:convert';

EmpResponse empResponseFromJson(String str) => EmpResponse.fromJson(json.decode(str));

String empResponseToJson(EmpResponse data) => json.encode(data.toJson());

class EmpResponse {
  EmpResponse({
    this.status,
    this.data,
    this.message,
  });

  String? status;
  List<Employee>? data;
  String? message;

  factory EmpResponse.fromJson(Map<String, dynamic> json) => EmpResponse(
    status: json["status"],
    data: List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Employee {
  final int id;
  final String? employeeName;
  final int employeeAge;
  final double employeeSalary;

  Employee({
    required this.id,
    this.employeeName,
    required this.employeeAge,
    required this.employeeSalary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeAge: json['employee_age'],
      employeeSalary: json['employee_salary'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_age": employeeAge,
    "employee_salary": employeeSalary,
  };
}
