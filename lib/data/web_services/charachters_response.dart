import 'dart:convert';

import 'package:flutter_bloc_test2/constants/strings.dart';
import 'package:flutter_bloc_test2/data/models/charachters.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharachterResponse {
  Future<List<dynamic>?> getAllCharachter() async {
    http.Response response = await http.get(
      Uri.parse(basurl + 'characters'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('A7A');
      print(data.toString());
      return data;
    } else {
      print(response.reasonPhrase);
    }
    return [];
  }
}
