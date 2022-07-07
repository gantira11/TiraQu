import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiraqu/components/info_tagihan.dart';

class TabsRiwayat extends StatelessWidget {
  const TabsRiwayat({
    Key? key,
    required this.dataRiwayat,
  }) : super(key: key);

  final List dataRiwayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 40),
      child: ListView.builder(
        itemCount: dataRiwayat.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowD(
                    title1: "Bulan Tahun",
                    subtitle1: dataRiwayat[index].rek_bulan,
                    title2: "Bayar Tanggal",
                    subtitle2: DateFormat('dd MMMM yyyy', 'id_ID').format(
                      DateTime.parse(dataRiwayat[index].byr_tgl),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RowD(
                    title1: "Posisi Meter",
                    subtitle1: dataRiwayat[index].rek_stanlalu +
                        " - " +
                        dataRiwayat[index].rek_stankini,
                    title2: "Volume Pemakaian",
                    subtitle2: dataRiwayat[index].rek_pemair,
                  ),
                  const SizedBox(height: 8),
                  RowD(
                    title1: "Loket",
                    subtitle1: dataRiwayat[index].loket,
                    title2: "Total Bayar",
                    subtitle2: "Rp. " + dataRiwayat[index].rek_jumlah,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
