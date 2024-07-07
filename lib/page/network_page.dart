import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pdp_network/page/details_page.dart';

import '../Model/Post.dart';
import '../service/http_service.dart';


class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  var isLoading = false;
  var items = <Employee>[];

  @override
  void initState() {
    super.initState();
    _apiEmployeeList();
  }

  void _apiEmployeeList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      setState(() {
        isLoading = false;
        items = Network.parseEmployeeList(response);
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _apiEmployeeCreate(Employee employee) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee)).then((response) {
      print(response.toString());
    });
  }

  void _apiEmployeeUpdate(Employee employee) {
    Network.PUT(Network.API_UPDATE + employee.id.toString(), Network.paramsUpdate(employee)).then((response) {
      print(response.toString());
    });
  }

  void _apiEmployeeDelete(Employee employee) {
    Network.DEL(Network.API_DELETE + employee.id.toString(), Network.paramsEmpty()).then((response) {
      print(response.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Networking"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return itemHomeEmployee(items[index]);
            },
          ),
          isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget itemHomeEmployee(Employee employee) {
    return Slidable(
      key: ValueKey(employee.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _apiEmployeeDelete(employee);
              print(employee.toJson());
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(employee: employee),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.employeeName!.toUpperCase(),
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("Age: ${employee.employeeAge}"),
              Text("Salary: ${employee.employeeSalary}")
            ],
          ),
        ),
      ),
    );
  }
}
