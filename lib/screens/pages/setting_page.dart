import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/api/network.dart';
import 'package:tiraqu/components/custom_button.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Future<void> _logout() async {
    final response = await Network().authLogout('/logout');
    var body = json.decode(response.body);

    print(body);

    if (body['success']) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.remove('no_pel');
      _prefs.remove('username');
      _prefs.remove('token');

      Navigator.pushReplacementNamed(context, '/leanding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SubmitButton(
          textButton: 'Logout',
          onPressed: () {
            _logout();
          },
        ),
      ),
    );
  }
}
