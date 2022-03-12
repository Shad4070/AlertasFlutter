import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final String userName;
  final String password;

  Post({this.userName, this.password});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      userName: json['userName'],
      password: json['password'],
    );


  }
}

Future<String> consultarToken(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://34.214.57.162:3001/signin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //Post.fromJson(jsonDecode(response.body));
    String res = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(res);
    return res;



    //return response.body.toString();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}



