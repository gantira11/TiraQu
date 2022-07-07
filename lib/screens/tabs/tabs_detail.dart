import 'package:flutter/material.dart';
import 'package:tiraqu/components/info_tagihan.dart';

class TabsDetail extends StatelessWidget {
  const TabsDetail({
    Key? key,
    required this.detailTagihan,
  }) : super(key: key);

  final List detailTagihan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: detailTagihan.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bulan Tahun",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    detailTagihan[index].rek_bulan,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RowD(
                    title1: "Posisi Meter",
                    subtitle1: detailTagihan[index].rek_stanlalu +
                        " - " +
                        detailTagihan[index].rek_stankini,
                    title2: "Volume Pemakaian",
                    subtitle2: detailTagihan[index].rek_pemair,
                  ),
                  const SizedBox(height: 8),
                  RowD(
                    title1: "Beban",
                    subtitle1: "Rp. " + detailTagihan[index].rek_meter,
                    title2: "Pemakaian Air",
                    subtitle2: "Rp. " + detailTagihan[index].rek_uangair,
                  ),
                  const SizedBox(height: 8),
                  RowD(
                    title1: "Materai",
                    subtitle1: "Rp. " + detailTagihan[index].rek_materai,
                    title2: "Angsuran",
                    subtitle2: "Rp. " + detailTagihan[index].rek_angsuran,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.only(right: 27),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Denda",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          "Rp. " + detailTagihan[index].rek_denda,
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Tagihan",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        "Rp. " + detailTagihan[index].rek_jumlah,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
