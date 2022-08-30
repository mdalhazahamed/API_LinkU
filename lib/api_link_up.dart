import 'package:api/moldel/comments.dart';
import 'package:api/moldel/comments_helper.dart';
import 'package:flutter/material.dart';

class ApiLin_Up extends StatefulWidget {
  @override
  State<ApiLin_Up> createState() => _ApiLin_UpState();
}

class _ApiLin_UpState extends State<ApiLin_Up> {
  List<Comments>? comments;

  bool isLoaded = false;

  getData() async {
    comments = await CommentsHelper().getComments();

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("API Link-Up")),
        leading: Icon(Icons.api),
      ),
      backgroundColor: Colors.grey,
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("PostId: "),
                                  Text(
                                    comments![index].postId.toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Id: - "),
                                  Text(
                                    comments![index].id.toString(),
                                    style: TextStyle(
                                      color: Colors.green,
                                      
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                             Row(
                                children: [
                                  Text("Name: "),
                                  Text(
                                    comments![index].name,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Eamil: "),
                                  Text(
                                    comments![index].email,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  
                                  Text(
                                    comments![index].body,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
