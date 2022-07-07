// ignore_for_file: non_constant_identifier_names

class Riwayat {
  final String pel_no;
  final String rek_nomor;
  final String byr_serial;
  final String rek_tgl;
  final String rek_thn;
  final String rek_bulan;
  final String rek_stanlalu;
  final String rek_stankini;
  final String rek_pemair;
  final String rek_uangair;
  final String rek_adm;
  final String rek_meter;
  final String rek_denda;
  final String rek_materai;
  final String rek_angsuran;
  final String rek_total;
  final String rek_jumlah;
  final String byr_tgl;
  final String byr_upd_sts;
  final String loket;

  Riwayat._({
    required this.pel_no,
    required this.rek_nomor,
    required this.byr_serial,
    required this.rek_tgl,
    required this.rek_bulan,
    required this.rek_thn,
    required this.rek_stanlalu,
    required this.rek_stankini,
    required this.rek_pemair,
    required this.rek_uangair,
    required this.rek_adm,
    required this.rek_meter,
    required this.rek_denda,
    required this.rek_materai,
    required this.rek_angsuran,
    required this.rek_total,
    required this.rek_jumlah,
    required this.byr_tgl,
    required this.byr_upd_sts,
    required this.loket,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return Riwayat._(
      pel_no: json['pel_no'],
      rek_nomor: json['rek_nomor'].toString(),
      byr_serial: json['byr_serial'],
      rek_tgl: json['rek_tgl'],
      rek_bulan: json['rek_bulan'].toString(),
      rek_thn: json['rek_thn'].toString(),
      rek_stanlalu: json['rek_stanlalu'],
      rek_stankini: json['rek_stankini'],
      rek_pemair: json['rek_pemair'],
      rek_uangair: json['rek_uangair'],
      rek_adm: json['rek_adm'],
      rek_meter: json['rek_meter'],
      rek_denda: json['rek_denda'],
      rek_materai: json['rek_materai'],
      rek_angsuran: json['rek_angsuran'],
      rek_total: json['rek_total'],
      rek_jumlah: json['rek_jumlah'],
      byr_tgl: json['byr_tgl'],
      byr_upd_sts: json['byr_upd_sts'],
      loket: json['Loket'],
    );
  }
}
