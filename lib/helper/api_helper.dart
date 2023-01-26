import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_app/%20models/post_model.dart';


class APIhelper{
  APIhelper._();
  static final APIhelper apiHelper = APIhelper._();

  Future < Post? > fetchData() async {
    String baseUrl = "https://jsonplaceholder.typicode.com";
    String endPoint = "/posts/8";

    String api = baseUrl + endPoint;

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      // Dart objects
      Map decodedData = jsonDecode(res.body);

      //custom objects
      Post p1 = Post(
        id: decodedData['id'],
        userid: decodedData['userId'],
        title: decodedData['title'],
        body: decodedData['body'],
      );

      return p1;
    }
    else {
      return null;
    }
  }
}