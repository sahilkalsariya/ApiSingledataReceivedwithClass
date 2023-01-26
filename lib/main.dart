import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_app/%20models/post_model.dart';
import 'package:json_app/helper/api_helper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: APIhelper.apiHelper.fetchData(), // only future ley 6e..
          builder: (context, snapshot) {
            // APIhelper no badho data snpshot ma aave //
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              Post? data = snapshot.data as Post?;
              return (data != null)
                  ? Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text("${data.id}"),
                        title: Text("${data.title}"),
                        subtitle: Text("${data.body}"),
                        trailing: Text("${data.userid}"),
                      ),
                    )
                  : Text("No data....");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
