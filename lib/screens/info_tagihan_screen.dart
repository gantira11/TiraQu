import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tiraqu/models/pelanggan.dart';
import 'package:tiraqu/models/riwayat.dart';
import 'package:tiraqu/models/tagihan.dart';
import 'package:tiraqu/api/network.dart';
import 'package:tiraqu/components/custom_button.dart';
import 'package:tiraqu/components/custom_text_form_field.dart';
import 'package:tiraqu/screens/modals/modal_tagihan.dart';

class InfoTagihanScreen extends StatefulWidget {
  const InfoTagihanScreen({Key? key}) : super(key: key);

  @override
  State<InfoTagihanScreen> createState() => _InfoTagihanScreenState();
}

class _InfoTagihanScreenState extends State<InfoTagihanScreen> {
  final TextEditingController _noPelanggan = TextEditingController();

  List pelanggan = [];
  List riwayat = [];
  List tagihan = [];

  Future<void> _cekTagihan() async {
    var formData = {
      'no_pelanggan': _noPelanggan.text,
    };

    var response = await Network().postT(formData, '/info-tagihan-p');
    var body = jsonDecode(response.body);

    if (body['success']) {
      setState(() {
        pelanggan =
            body['pelanggan'].map((data) => Pelanggan.fromJson(data)).toList();
        riwayat =
            body['riwayat'].map((data) => Riwayat.fromJson(data)).toList();
        tagihan =
            body['tagihan'].map((data) => Tagihan.fromJson(data)).toList();
        EasyLoading.dismiss();
        showBarModalBottomSheet(
          context: context,
          builder: (context) => ModalTagihan(
            pelanggan: pelanggan,
            tagihan: tagihan,
            riwayat: riwayat,
          ),
        );
      });
    } else {
      EasyLoading.dismiss();
      EasyLoading.showInfo(
        body['msg'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_new_rounded,
        //   ),
        //   onPressed: () {},
        // ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.black,
        ),
        title: const Text(
          "Info Tagihan",
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Masukan No. Pelanggan",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextInputOutlineBorder(
                controller: _noPelanggan,
                label: 'No. Pelanggan',
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                validator: (String? value) {},
              ),
              SubmitButton(
                textButton: 'Submit',
                onPressed: () {
                  EasyLoading.show(status: 'Mohon Tunggu...');
                  _cekTagihan();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
