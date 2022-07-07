// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF20458A);
const kLightPrimaryColor = Color(0xFF679FF1);

class Info {
  final String pel_no;
  final String rek_nomor;
  final String rek_tgl;
  final String rek_bln;
  final String rek_thn;
  final String rek_dkd;
  final String rek_stanlalu;
  final String rek_stankini;
  final String rek_uangair;
  final String rek_adm;
  final String rek_meter;
  final String rek_denda;
  final String rek_materai;
  final String rek_angsuran;
  final String rek_total;
  final String rek_gol;
  final String rek_loket;
  final String rek_trek;
  final String rek_pindah;
  final String rek_sts;
  final String rek_byr_sts;
  final String kar_id;
  final String tar_kode;

  Info._({
    required this.pel_no,
    required this.rek_nomor,
    required this.rek_tgl,
    required this.rek_bln,
    required this.rek_thn,
    required this.rek_dkd,
    required this.rek_stanlalu,
    required this.rek_stankini,
    required this.rek_uangair,
    required this.rek_adm,
    required this.rek_meter,
    required this.rek_denda,
    required this.rek_materai,
    required this.rek_angsuran,
    required this.rek_total,
    required this.rek_gol,
    required this.rek_loket,
    required this.rek_trek,
    required this.rek_pindah,
    required this.rek_sts,
    required this.rek_byr_sts,
    required this.kar_id,
    required this.tar_kode,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info._(
      pel_no: json['pel_no'],
      rek_nomor: json['rek_nomor'].toString(),
      rek_tgl: json['rek_tgl'],
      rek_bln: json['rek_bln'].toString(),
      rek_thn: json['rek_thn'].toString(),
      rek_dkd: json['rek_dkd'],
      rek_stanlalu: json['rek_stanlalu'].toString(),
      rek_stankini: json['rek_stankini'].toString(),
      rek_uangair: json['rek_uangair'].toString(),
      rek_adm: json['rek_adm'].toString(),
      rek_meter: json['rek_meter'].toString(),
      rek_denda: json['rek_denda'].toString(),
      rek_materai: json['rek_materai'].toString(),
      rek_angsuran: json['rek_angsuran'].toString(),
      rek_total: json['rek_total'].toString(),
      rek_gol: json['rek_gol'],
      rek_loket: json['rek_loket'],
      rek_trek: json['rek_trek'],
      rek_pindah: json['rek_pindah'],
      rek_sts: json['rek_sts'].toString(),
      rek_byr_sts: json['rek_byr_sts'].toString(),
      kar_id: json['kar_id'],
      tar_kode: json['tar_kode'],
    );
  }
}
