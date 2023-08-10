import 'package:flutter/cupertino.dart';

class Login_Models{
  late String status;
  late String  token;

  Login_Models.fromjson(Map<String,dynamic> json)
  { status=json['status'];
  token=json['token'];
  }
}

