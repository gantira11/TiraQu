import 'package:flutter/material.dart';

class CustomCardPengumuman extends StatelessWidget {
  const CustomCardPengumuman({
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageName,
                width: 100,
              ),
              const Divider(
                thickness: 2,
                height: 10,
                indent: 170,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
