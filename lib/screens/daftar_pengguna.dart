// ignore_for_file: unnecessary_null_comparison, body_might_complete_normally_nullable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/api/network.dart';
import 'package:tiraqu/components/custom_button.dart';
import 'package:tiraqu/components/custom_text_form_field.dart';

class DaftarPenggunaScreen extends StatefulWidget {
  const DaftarPenggunaScreen({Key? key}) : super(key: key);

  @override
  State<DaftarPenggunaScreen> createState() => _DaftarPenggunaScreenState();
}

class _DaftarPenggunaScreenState extends State<DaftarPenggunaScreen> {
  bool showPassword = true;
  bool showPassword2 = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noPelanggan = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _noTelp = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();

  Future<void> _registerPengguna() async {
    var formData = {
      'no_pelanggan': _noPelanggan.text,
      'username': _username.text,
      'password': _password.text,
      'password_confirmation': _passwordC.text,
      'no_telp': _noTelp.text
    };

    var responses = await Network().auth(formData, '/register-pengguna');
    var body = json.decode(responses.body);

    print(body);

    if (body['success']) {
      EasyLoading.showSuccess('Register Berhasil');

      Navigator.pushReplacementNamed(context, '/leanding');

      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('no_pel', body['user']['no_pelanggan']);
      _prefs.setString('username', body['user']['username']);
      _prefs.setString('token', body['token']);
    } else {
      if (body['msg']['no_pelanggan'] != null) {
        EasyLoading.showInfo(body['msg']['no_pelanggan'][0]);
      } else if (body['msg']['no_telp'] != null) {
        EasyLoading.showInfo(body['msg']['no_telp'][0]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.black,
        ),
        title: const Text(
          "Daftar Pengguna",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextInputOutlineBorder(
                label: 'No. Pelanggan',
                controller: _noPelanggan,
                maxLength: 6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                validator: (String? _noPelangggan) {
                  if (_noPelanggan == null || _noPelangggan!.isEmpty) {
                    return 'No. Pelanggan harus diisi';
                  }
                  return null;
                },
              ),
              CustomTextInputOutlineBorder(
                label: 'Username',
                controller: _username,
                maxLength: 255,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                validator: (String? _username) {
                  if (_username == null || _username.isEmpty) {
                    return 'Username harus diisi';
                  }
                  return null;
                },
              ),
              CustomTextFormFieldOBorderIcon(
                label: 'Password',
                controller: _password,
                obscureText: showPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
                validator: (String? _password) {
                  if (_password == null || _password.isEmpty) {
                    return 'Password harus diisi';
                  }
                  return null;
                },
              ),
              CustomTextFormFieldOBorderIcon(
                label: 'Password Confirmation',
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      showPassword2 = !showPassword2;
                    });
                  },
                  child: Icon(
                    showPassword2
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
                controller: _passwordC,
                obscureText: showPassword2,
                validator: (String? _passwordC) {
                  if (_passwordC == null || _passwordC.isEmpty) {
                    return 'Password harus diisi';
                  } else if (_passwordC != _password.text) {
                    return 'Password harus sesuai';
                  }
                  return null;
                },
              ),
              CustomTextInputOutlineBorder(
                label: 'No. Telp',
                controller: _noTelp,
                maxLength: 20,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                validator: (String? _noTelp) {
                  if (_noTelp == null || _noTelp.isEmpty) {
                    return 'No. Telp harus diisi';
                  }
                },
              ),
              FormSubmitButton(
                textButton: 'Daftar',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _registerPengguna();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
