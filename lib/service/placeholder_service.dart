import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class PlaceholderService{
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  getPosts() async{
    var response = await http.get('$baseUrl/posts');
    print(response.toString());
  }

}