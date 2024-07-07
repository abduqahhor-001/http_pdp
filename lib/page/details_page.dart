
import 'package:flutter/material.dart';
import '../Model/Post.dart';

class DetailsPage extends StatelessWidget {
  final Employee employee;

  const DetailsPage({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page' ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' ${employee.employeeName} ( ${employee.employeeAge})',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(' ${employee.employeeSalary}', style: const TextStyle(fontSize: 18)),
            // Add more fields as needed
          ],
        ),
      )

    );
  }
}
