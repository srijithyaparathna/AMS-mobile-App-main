import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class Api {

  static const baseUrl = "http://192.168.1.3/api/";
  static addlogindetail(Map pdata) async {

    var url = Uri.parse("${baseUrl}login");

    try {
      final res = await http.post(Uri.parse(baseUrl), body: {
        "email": pdata["email"],
        "password": pdata["password"],
      });
      if (res.statusCode == 200) {
        return res.body;
        
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  }












