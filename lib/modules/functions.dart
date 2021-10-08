import 'dart:convert';

import "package:http/http.dart" as http;


Future<Map<String, dynamic>> postRequest({required api, dynamic body, required Map<String, String> header}) async {
    if(header == null) 
        header = {'Content-Type': 'application/json'};

    final uri = new Uri.https('baa2-110-139-16-187.ngrok.io/$api', '?', {});
    
    var res = await http.post(uri, body: jsonEncode(body));
    if (res.statusCode == 200){
        return json.decode(utf8.decode(res.bodyBytes));
    }
    if (res.statusCode == 404)
        throw Exception("404 not found");
    throw Exception(json.decode(utf8.decode(res.bodyBytes))['messages']);
    
}
