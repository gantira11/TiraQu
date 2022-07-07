// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tiraqu/api/network.dart';
import 'package:tiraqu/models/pelanggan.dart';

class InfoPelangganScreen extends StatefulWidget {
  const InfoPelangganScreen({
    Key? key,
    required this.nomor_sl,
  }) : super(key: key);

  final String nomor_sl;

  @override
  State<InfoPelangganScreen> createState() => _InfoPelangganScreenState();
}

class _InfoPelangganScreenState extends State<InfoPelangganScreen> {
  List pelanggan = [];
  late Future<Pelanggan> infoPelanggan;

  Future<Pelanggan> _getInfoPelanggan() async {
    String nomor_sl = widget.nomor_sl;
    var response = await Network().getData('/info-pelanggan/$nomor_sl');
    var body = json.decode(response.body);

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return Pelanggan.fromJson(body['pelanggan']);
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoPelanggan = _getInfoPelanggan();
    EasyLoading.show(status: 'Mohon Tunggu ..');
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
          "Info Pelanggan",
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
        child: FutureBuilder<Pelanggan>(
          future: infoPelanggan,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoxInfo(
                            title: 'Nomor Pelanggan',
                            subtitle: snapshot.data!.nomor_sl,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              BoxInfo(
                                title: 'Nama Lengkap',
                                subtitle: snapshot.data!.nama,
                              ),
                              BoxInfo(
                                title: 'Golongan',
                                subtitle: snapshot.data!.golongan,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              BoxInfo(
                                title: 'Alamat',
                                subtitle: snapshot.data!.alamat,
                              ),
                              BoxInfo(
                                title: 'Rayon Pembacaan',
                                subtitle: snapshot.data!.rayon,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              BoxInfo(
                                title: 'Status Pelanggan',
                                subtitle: snapshot.data!.status,
                              ),
                              BoxInfo(
                                title: 'Jumlah Tagihan',
                                subtitle: snapshot.data!.jml_rek,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Text("");
          },
        ),
      ),
    );
  }
}

class BoxInfo extends StatelessWidget {
  const BoxInfo({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
