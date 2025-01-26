import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
          LayoutBuilder(builder: (context, constraints) {
            final email = Column(
              children: [
                Text(
                  'E-mail',
                  style: GoogleFonts.urbanist(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                CardShadow(
                  text: 'sacgugalabs@gmail.com',
                  uri: Uri.parse('mailto:sacgugalabs@gmail.com'),
                ),
              ],
            );
            final socialMedia = Column(
              children: [
                Text(
                  'Social Media',
                  style: GoogleFonts.urbanist(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                CardShadow(
                  text: 'Github',
                  uri: Uri.parse('https://github.com/GugaLabs'),
                )
              ],
            );
            if (constraints.maxWidth < 900) {
              return Column(
                children: [
                  email,
                  const SizedBox(height: 32),
                  socialMedia,
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                email,
                socialMedia,
              ],
            );
          }),
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
    this.uri,
  });

  final Uri? uri;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: uri != null
          ? () async {
              if (await canLaunchUrl(uri!)) {
                await launchUrl(uri!);
              } else if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ops. Não foi possível abrir o link ;('),
                  ),
                );
              }
            }
          : null,
      child: Container(
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
                borderRadius:
                    BorderRadius.circular(8), // Arredondamento da borda
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
                      style: const TextStyle(
                          color: Color(0xff38b6ff), fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
