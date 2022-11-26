import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RequestResult {
  bool ok;
  Map<String, dynamic> data;
  RequestResult(this.ok, this.data);

  @override
  String toString() {
    return 'RequestResult{ok: $ok, data: $data}';
  }
}

const String domain = 'pokeapi.co';

Future<RequestResult> httpGet(String route) async {
  late Uri url;
  if (kDebugMode) {
    url = Uri.http(domain, "/api/v2$route");
  } else {
    url = Uri.https(domain, "/api/v2$route");
  }
  return _makeGetPetition(url);
}

Future<Uint8List?> httpGetImage(String route) async {
  late Uri url;
  if (kDebugMode) {
    url = Uri.http(domain, "/api/v2$route");
  } else {
    url = Uri.https(domain, "/api/v2$route");
  }
  return _makeGetImagePetition(url);
}

Future<RequestResult> httpPost(String route, [dynamic data]) async {
  late Uri url;
  if (kDebugMode) {
    url = Uri.http(domain, "/api/v2$route");
  } else {
    url = Uri.https(domain, "/api/v2$route");
  }
  String dataStr = jsonEncode(data);
  return _makePostPetition(url, dataStr);
}

Future<RequestResult> httpPut(String route, [dynamic data]) async {
  late Uri url;
  if (kDebugMode) {
    url = Uri.http(domain, "/api/v2$route");
  } else {
    url = Uri.https(domain, "/api/v2$route");
  }
  String dataStr = jsonEncode(data);
  return _makePutPetition(url, dataStr);
}

Future<RequestResult> _makeGetPetition(Uri url) async {
  log('GET: $url');
  http.Response response;
  try {
    response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control_Allow_Origin': '*',
      },
    );
  } catch (e) {
    log("Error: $e", name: "httpGet");
    return RequestResult(false, {
      'status': 'no_connection',
      'error': e.toString(),
    });
  }
  return _parseResultString(response.body);
}

Future<Uint8List?> _makeGetImagePetition(Uri url) async {
  log('GET: $url');
  http.Response response;
  try {
    response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control_Allow_Origin': '*',
      },
    );
  } catch (e) {
    log("Error: $e", name: "httpGet");
    throw Exception('Error: $e');
  }
  return response.bodyBytes;
}

Future<RequestResult> _makePostPetition(Uri url, String dataStr) async {
  log('POST: $url');
  http.Response response;
  try {
    response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control_Allow_Origin': '*',
        },
        body: dataStr);
  } catch (e) {
    log("Error: $e", name: "httpPost");
    return RequestResult(false, {
      'status': 'no_connection',
      'error': e.toString(),
    });
  }
  return _parseResultString(response.body);
}

Future<RequestResult> _makePutPetition(Uri url, String dataStr) async {
  log('PUT: $url');

  http.Response response;
  try {
    response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control_Allow_Origin': '*',
      },
      body: dataStr,
    );
  } catch (e) {
    log("Error: $e", name: "httpPut");
    return RequestResult(false, {
      'status': 'no_connection',
      'error': e.toString(),
    });
  }
  return _parseResultString(response.body);
}

RequestResult _parseResultString(String body) {
  if (body.startsWith('<')) {
    return RequestResult(false, {
      'status': 'error',
      'error': body,
    });
  } else {
    return RequestResult(true, jsonDecode(body));
  }
}
