// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names

class Pelanggan {
  final String kota_pelayanan;
  final String nomor_sl;
  final String nama;
  final String alamat;
  final String golongan;
  final String rayon;
  final String status;
  final String jml_rek;
  final String jml_rupiah;
  final String jml_denda;
  final String jml_piutang;

  Pelanggan._({
    required this.kota_pelayanan,
    required this.nomor_sl,
    required this.nama,
    required this.alamat,
    required this.golongan,
    required this.rayon,
    required this.status,
    required this.jml_rek,
    required this.jml_rupiah,
    required this.jml_denda,
    required this.jml_piutang,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan._(
      kota_pelayanan: json['kota_pelayanan'],
      nomor_sl: json['nomor_sl'],
      nama: json['nama'],
      alamat: json['alamat'],
      golongan: json['golongan'],
      rayon: json['rayon'],
      status: json['status'],
      jml_rek: json['jml_rek'] == null ? "0" : json['jml_rek'].toString(),
      jml_rupiah: json['jml_rupiah'] == null ? "0" : json['jml_rupiah'],
      jml_denda: json['jml_denda'] == null ? "0" : json['jml_denda'],
      jml_piutang: json['jml_piutang'] == null ? "0" : json['jml_piutang'],
    );
  }
}
