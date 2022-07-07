import 'package:flutter/material.dart';
import 'package:tiraqu/components/custom_button.dart';
import 'package:tiraqu/components/custom_cart.dart';
import 'package:tiraqu/constant.dart';

class LeandingPage extends StatelessWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TiraQu',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Material(
              elevation: 3,
              child: Container(
                color: Colors.white,
                width: size.width * 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        "Mau tau informasi tagihan secara lengkap?",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/login');
                                        },
                                        child: const Text(
                                          'Subscribe!',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: kLightPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/card_img.jpg',
                                width: 100,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              icon: Icons.login_rounded,
                              text: 'Login',
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                            CustomIconButton(
                              icon: Icons.app_registration_rounded,
                              text: 'Daftar Pengguna',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/daftar-pengguna');
                              },
                            ),
                            CustomIconButton(
                              icon: Icons.app_registration_outlined,
                              text: "Daftar Pelanggan",
                              onTap: () {},
                            ),
                            CustomIconButton(
                              icon: Icons.calculate_rounded,
                              text: "Info Tagihan",
                              onTap: () {
                                Navigator.pushNamed(context, '/info-tagihan');
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Padding(
                      //   padding: const EdgeInsets.all(9.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       CustomIconButton(
                      //         icon: Icons.calculate_rounded,
                      //         text: "Info Tagihan",
                      //         onTap: () {
                      //           Navigator.pushNamed(context, '/info-tagihan');
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Informasi Terbaru",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row()
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  CustomCardPengumuman(
                    imageName: 'assets/images/card_img.jpg',
                    title:
                        "Pemberitahuan Gangguan Pengaliran Wilayah II Di Jl. Raya Laswi (Cipicung)",
                    date: '24 Apr 2022',
                  ),
                  CustomCardPengumuman(
                    imageName: 'assets/images/card_img.jpg',
                    title:
                        "Pemberitahuan Gangguan Pengaliran Wilayah II Di Jl. Raya Laswi (Cipicung)",
                    date: '24 Apr 2022',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
