// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tiraqu/screens/daftar_pengguna.dart';
import 'package:tiraqu/screens/info_pelanggan.dart';
import 'package:tiraqu/screens/info_tagihan_screen.dart';
import 'package:tiraqu/screens/leanding_screen.dart';
import 'package:tiraqu/screens/login_screen.dart';
import 'package:tiraqu/screens/on_boarding_screen.dart';
import 'package:tiraqu/screens/splash_screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/leanding':
        return MaterialPageRoute(builder: (_) => const LeandingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/info-tagihan':
        return MaterialPageRoute(builder: (_) => const InfoTagihanScreen());
      case '/daftar-pengguna':
        return MaterialPageRoute(builder: (_) => const DaftarPenggunaScreen());
      //  User Screen
      case '/info-pelanggan':
        final args = settings.arguments as InfoArguments;
        return MaterialPageRoute(
          builder: (_) => InfoPelangganScreen(
            nomor_sl: args.nomor_sl,
          ),
        );
      // case '/user-screen':
      //   return MaterialPageRoute(builder: (_) => const UserScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found!"),
        ),
        body: const Center(
          child: Text("Error 404!"),
        ),
      );
    });
  }
}

class InfoArguments {
  final String nomor_sl;

  InfoArguments(this.nomor_sl);
}
