import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guga_portfolio/widgets/profile_card.dart';

class BodyAbout extends StatelessWidget {
  const BodyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Sobre nós',
            style: GoogleFonts.museoModerno(
              fontSize: 48,
              color: const Color(0xff38b6ff),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ProfileCard(
                    imagePath: 'assets/images/gabriel.png',
                    description:
                        'Olá, meu nome é Gabriel, sou desenvolvedor de software, e desde o início da minha carreira, encontrei afinidade com o desenvolvimento mobile e tenho me dedicado cada vez mais para me aprimorar no que amo.',
                  ),
                ),
                VerticalDivider(
                  color: Color(0xff38b6ff),
                  thickness: 4,
                ),
                Expanded(
                  child: ProfileCard(
                    imagePath: 'assets/images/gustavo.png',
                    description:
                        'Olá, meu nome é Gustavo, sou desenvolvedor de software, e entusiasta de tecnologia pelo seu poder de transformar ideias em realidade, dinamizar o estático e democratizar o restrito.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
