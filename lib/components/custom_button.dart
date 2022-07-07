import 'package:flutter/material.dart';
import 'package:tiraqu/constant.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kLightPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kLightPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

// Icon Button With Text
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 85,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kLightPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
