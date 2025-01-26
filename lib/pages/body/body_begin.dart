import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guga_portfolio/pages/animations/circle_particle.dart';
import 'package:guga_portfolio/pages/animations/gradient_widget.dart';
import 'package:guga_portfolio/pages/animations/particle_widget.dart';

class BodyBegin extends StatelessWidget {
  const BodyBegin({super.key});

  @override
  Widget build(BuildContext context) {
    return ParticlesBackground(
      child: AnimatedBackground(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'A GugaLabs nasceu para\nentregar as soluções recentes\nque o mercado tem a oferecer',
                style: GoogleFonts.roboto(
                  fontSize: 48,
                  color: const Color(0xff38b6ff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
