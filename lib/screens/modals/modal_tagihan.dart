// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:tiraqu/constant.dart';
import 'package:tiraqu/screens/tabs/tabs_detail.dart';
import 'package:tiraqu/screens/tabs/tabs_riwayat.dart';
import 'package:tiraqu/screens/tabs/tabs_tagihan.dart';

class ModalTagihan extends StatefulWidget {
  final List pelanggan;
  final List riwayat;
  final List tagihan;

  const ModalTagihan({
    Key? key,
    required this.pelanggan,
    required this.riwayat,
    required this.tagihan,
  }) : super(key: key);

  @override
  State<ModalTagihan> createState() =>
      _ModalTagihanState(pelanggan, riwayat, tagihan);
}

class _ModalTagihanState extends State<ModalTagihan> {
  final List pelanggan;
  final List riwayat;
  final List tagihan;
  _ModalTagihanState(this.pelanggan, this.riwayat, this.tagihan);

  List dataPelanggan = [];
  List detailTagihan = [];
  List dataRiwayat = [];

  @override
  void initState() {
    super.initState();
    dataPelanggan = pelanggan;
    dataRiwayat = riwayat;
    detailTagihan = tagihan;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // leading: Container(),
          title: const Center(
            child: Text(
              'Informasi Tagihan',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dataPelanggan[0].nama,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dataPelanggan[0].nomor_sl,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Text(
                            "STATUS :",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            dataPelanggan[0].status == "NORMAL"
                                ? "AKTIF"
                                : dataPelanggan[0].status,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 2),
                const Text(
                  "Info Rekening",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                const TabBar(
                  indicatorColor: kLightPrimaryColor,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  tabs: [
                    Tab(text: "Tagihan"),
                    Tab(text: "Detail"),
                    Tab(text: "Riwayat"),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    child: TabBarView(
                      children: [
                        TabsTagihan(dataPelanggan: dataPelanggan),
                        TabsDetail(detailTagihan: detailTagihan),
                        TabsRiwayat(dataRiwayat: dataRiwayat)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
