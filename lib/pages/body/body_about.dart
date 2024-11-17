import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildProfileCard(
                    imagePath: 'assets/images/gabriel.png',
                    description:
                        'Olá, meu nome é Gabriel, sou desenvolvedor de software, e desde o início da minha carreira, encontrei afinidade com o desenvolvimento mobile e tenho me dedicado cada vez mais para me aprimorar no que amo.',
                    context: context,
                  ),
                ),
                const VerticalDivider(
                  color: Color(0xff38b6ff),
                  thickness: 4,
                ),
                Expanded(
                  child: _buildProfileCard(
                    imagePath: 'assets/images/gustavo.png',
                    description:
                        'Olá, meu nome é Gustavo, sou desenvolvedor de software, e entusiasta de tecnologia pelo seu poder de transformar ideias em realidade, dinamizar o estático e democratizar o restrito.',
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard({
    required String imagePath,
    required String description,
    required BuildContext context,
  }) {
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
