import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkBrain {

  NetworkBrain({required this.path});
  final String path;

  Future getData() async {
    final url = Uri.parse(path);

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print('Failed with status: ${response.statusCode}');
    }
  }
}