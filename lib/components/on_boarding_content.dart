import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String image, title, desc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.16,
            left: size.width * 0.08,
            right: size.width * 0.08,
          ),
          child: Column(
            children: <Widget>[
              // Image.asset(
              //   image,
              //   height: 270,
              // ),
              Container(
                height: 250,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.08),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Divider(
              //   thickness: 2.0,
              //   indent: size.width * 0.3,
              //   endIndent: size.width * 0.3,
              // ),
              const SizedBox(height: 15),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
