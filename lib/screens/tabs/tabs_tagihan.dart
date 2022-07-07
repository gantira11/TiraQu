import 'package:flutter/material.dart';

class TabsTagihan extends StatelessWidget {
  const TabsTagihan({
    Key? key,
    required this.dataPelanggan,
  }) : super(key: key);

  final List dataPelanggan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status Tagihan",
                style: TextStyle(fontFamily: 'Lato', fontSize: 14),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: int.parse(dataPelanggan[0].jml_rek) > 0
                      ? Colors.red
                      : Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    int.parse(dataPelanggan[0].jml_rek) > 0
                        ? " Belum Lunas"
                        : " Lunas",
                    style: const TextStyle(
                        fontFamily: 'Lato', fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Table(
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Keterangan",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Jumlah",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Biaya",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Jumlah Tagihan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      dataPelanggan[0].jml_rek,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Rp. " + dataPelanggan[0].jml_rupiah,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Jumlah Denda",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Rp. " + dataPelanggan[0].jml_denda,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Total Tagihan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      dataPelanggan[0].jml_rek,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Rp. " + dataPelanggan[0].jml_piutang,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
