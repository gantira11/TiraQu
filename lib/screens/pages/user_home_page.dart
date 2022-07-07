import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/components/custom_button.dart';
import 'package:tiraqu/components/custom_cart.dart';
import 'package:tiraqu/routes/route.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String username = "";
  String noPel = "";

  Future<void> getUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      noPel = _prefs.getString('no_pel').toString();
      username =
          toBeginningOfSentenceCase(_prefs.getString('username').toString())!;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

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
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   elevation: 3,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(12.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: <Widget>[
                      //         Flexible(
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //                 const Text(
                      //                   "Mau tau informasi tagihan secara lengkap?",
                      //                   style: TextStyle(
                      //                     fontFamily: 'Poppins',
                      //                     fontWeight: FontWeight.w300,
                      //                     fontSize: 15,
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 10),
                      //                 InkWell(
                      //                   onTap: () {
                      //                     Navigator.pushNamed(
                      //                         context, '/login');
                      //                   },
                      //                   child: const Text(
                      //                     'Subscribe!',
                      //                     style: TextStyle(
                      //                       fontFamily: 'Lato',
                      //                       fontWeight: FontWeight.w700,
                      //                       fontSize: 13,
                      //                       color: kLightPrimaryColor,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Image.asset(
                      //           'assets/images/card_img.jpg',
                      //           width: 100,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  username,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  noPel,
                                  style: const TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(width: 60),
                            const Icon(
                              Icons.notifications,
                              color: Colors.black54,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              icon: Icons.description_outlined,
                              text: 'Info Pelanggan',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/info-pelanggan',
                                  arguments: InfoArguments(noPel),
                                );
                              },
                            ),
                            CustomIconButton(
                              icon: Icons.info_outline_rounded,
                              text: 'Info Tagihan',
                              onTap: () {
                                getUser();
                              },
                            ),
                            CustomIconButton(
                              icon: Icons.info_outline_rounded,
                              text: "Info ....",
                              onTap: () {
                                Navigator.pushNamed(context, '/info-tagihan');
                              },
                            ),
                            CustomIconButton(
                              icon: Icons.calculate_rounded,
                              text: "Info Bacaan",
                              onTap: () {},
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
                      //         icon: Icons.bubble_chart,
                      //         text: 'Subscribe',
                      //         onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
