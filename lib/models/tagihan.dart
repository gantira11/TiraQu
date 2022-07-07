// ignore_for_file: non_constant_identifier_names

class Tagihan {
  final String pel_no;
  final String rek_nomor;
  final String rek_tgl;
  final String rek_bulan;
  final String rek_thn;
  final String rek_stankini;
  final String rek_stanlalu;
  final String rek_pemair;
  final String rek_uangair;
  final String rek_adm;
  final String rek_meter;
  final String rek_denda;
  final String rek_materai;
  final String rek_angsuran;
  final String rek_total;
  final String rek_jumlah;

  Tagihan._({
    required this.pel_no,
    required this.rek_nomor,
    required this.rek_tgl,
    required this.rek_bulan,
    required this.rek_thn,
    required this.rek_stankini,
    required this.rek_stanlalu,
    required this.rek_pemair,
    required this.rek_uangair,
    required this.rek_adm,
    required this.rek_meter,
    required this.rek_denda,
    required this.rek_materai,
    required this.rek_angsuran,
    required this.rek_total,
    required this.rek_jumlah,
  });

  factory Tagihan.fromJson(Map<String, dynamic> json) {
    return Tagihan._(
      pel_no: json['pel_no'],
      rek_nomor: json['rek_nomor'].toString(),
      rek_tgl: json['rek_tgl'],
      rek_bulan: json['rek_bulan'],
      rek_thn: json['rek_thn'].toString(),
      rek_stankini: json['rek_stankini'],
      rek_stanlalu: json['rek_stanlalu'],
      rek_pemair: json['rek_pemair'],
      rek_uangair: json['rek_uangair'],
      rek_adm: json['rek_adm'],
      rek_meter: json['rek_meter'],
      rek_denda: json['rek_denda'],
      rek_materai: json['rek_materai'],
      rek_angsuran: json['rek_angsuran'],
      rek_total: json['rek_total'],
      rek_jumlah: json['rek_jumlah'],
    );
  }
}
