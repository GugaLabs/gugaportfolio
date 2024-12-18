import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyContact extends StatelessWidget {
  const BodyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Contato',
            style: GoogleFonts.museoModerno(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'E-mail',
                style: GoogleFonts.urbanist(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Text(
                'Social Media',
                style: GoogleFonts.urbanist(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardShadow(
                    text: 'gabrielcdonato@gmail.com',
                  ),
                ],
              ),
              Flexible(
                child: Wrap(
                  spacing: 10, // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardShadow(
                      text: 'Linkedin',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardShadow(
                      text: 'Github',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardShadow(
                      text: 'Medium',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardShadow(
                      text: 'Youtube',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 6,
          ),
        ],
      ),
    );
  }
}

class CardShadow extends StatelessWidget {
  final String text;
  const CardShadow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Arredondamento da borda
        boxShadow: const [
          BoxShadow(
            color: Color(0xff38b6ff),
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(2, 4), // Posição da sombra
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // Arredondamento da borda
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            0,
          ), // Mesmo arredondamento para a imagem
          child: Container(
            decoration: BoxDecoration(
              color: const Color(
                0xff161618,
              ),
              border: Border.all(
                color: const Color(0xff38b6ff),
                // Cor da borda
                width: 2.0, // Largura da borda
              ),
              borderRadius: BorderRadius.circular(8), // Arredondamento da borda
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.email,
                    color: Color(0xff38b6ff),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style:
                        const TextStyle(color: Color(0xff38b6ff), fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
