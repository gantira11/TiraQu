import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  // final String _url = 'http://192.168.21.107:8000/api';
  // final String _url = 'http://10.128.202.79:8000/api/v1';
  final String _url = 'http://103.75.237.46:8120/api/v1';

  var token;
  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('token');
  }

  setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  auth(data, apiURL) async {
    var fullUrl = _url + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  authLogout(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      headers: setHeaders(),
    );
  }

  postT(data, apiURL) async {
    var fullUrl = _url + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiURL) async {
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: setHeaders(),
    );
  }
}
