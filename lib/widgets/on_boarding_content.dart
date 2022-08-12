import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoardingContent extends StatelessWidget   {
  const OnBoardingContent({
    Key? key, required this.image, required this.title,
  }) : super(key: key);

  final String image;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/$image.PNG',
          height: 317,
        ),
        const SizedBox(
          height: 19,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff23203f),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Welcome Welcome Welcome  Welcome Welcome Welcome  Welcome Welcome Welcome Welcome Welcome Welcome Welcome',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff716f87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
