import 'package:flutter/material.dart';

import '../Model/Post.dart';
import '../service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _apiPostList();
    var post = Post(id: 1,employee_name: "abduqahhor",employee_salary: "500",employee_age: "20",profile_image: "");
    // _apiPostCreate(post);
    // _apiPostUpdate(post);
    _apiPostDelete(post);
  }
  void _apiPostList()  {

    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response)=>{
      print(response.toString())
    });

  }

  void _apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
      print(response.toString()),
    });
  }

  void _apiPostUpdate(Post post) {
    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
      print(response.toString()),
    });
  }

  void _apiPostDelete(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response.toString()),
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
