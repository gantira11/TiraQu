import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Berita',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              CustomCardBerita(
                imageName: 'assets/images/card_img.jpg',
                title:
                    "Pemberitahuan Gangguan Pengaliran Wilayah 2 Dan 3 Di Intake Cibangoak - IPA Ciparay",
                date: "19 Apr 2022",
              ),
              CustomCardBerita(
                imageName: 'assets/images/card_img.jpg',
                title:
                    "Pemberitahuan Gangguan Pengaliran Wilayah 2 Dan 3 Di Intake Cibangoak - IPA Ciparay",
                date: "19 Apr 2022",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardBerita extends StatelessWidget {
  const CustomCardBerita({
    Key? key,
    required this.imageName,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String imageName;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: size.width,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imageName,
                width: 110,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      thickness: 2,
                      indent: 180,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
