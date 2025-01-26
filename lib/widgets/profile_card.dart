import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.imagePath,
    required this.description,
    super.key,
  });

  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff38b6ff),
                spreadRadius: 8,
                blurRadius: 0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 6,
                  blurRadius: 0,
                  offset: Offset(8, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
