import 'package:flutter/material.dart';
import 'dart:math';

import 'package:guga_portfolio/colors.dart';
import 'package:guga_portfolio/pages/animations/gradient_widget.dart';
import 'package:guga_portfolio/pages/animations/particle_widget.dart';
import 'package:guga_portfolio/pages/animations/circle_particle.dart';

class BodyAboutUs extends StatelessWidget {
  const BodyAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ParticlesBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMobile)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: TeamDescription()),
                      const SizedBox(width: 16),
                      Expanded(child: TeamMembers()),
                    ],
                  )
                else ...[
                  const TeamDescription(),
                  const SizedBox(height: 24),
                  TeamMembers(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class TeamDescription extends StatelessWidget {
  const TeamDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Muito mais que uma empresa de desenvolvimento, somos uma empresa focada em resultados!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Somos movidos por tecnologia e levamos muito a sério nosso propósito.\n\n"
          "A GugaLabs foi fundada em 2024 por um time completamente apaixonado pelo que faz, hoje somos referência no mercado de TI, porque entregamos muito mais que soluções, entregamos inovação, agilidade e produtos de ponta para o seu negócio! Seguimos crescendo em tamanho e potência a cada ano, venha fazer parte dessa história!",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class TeamMembers extends StatelessWidget {
  final List<TeamMember> members = [
    TeamMember(name: "Carreira Gabriel", imageUrl: "assets/images/gabriel.png"),
    TeamMember(name: "Carreira Gustavo", imageUrl: "assets/images/gustavo.png"),
    TeamMember(name: "Carreira Ascenio", imageUrl: "assets/images/ascenio.png"),
  ];

  TeamMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: members.asMap().entries.map((entry) {
        final index = entry.key;
        final member = entry.value;

        // Calcula o ângulo de cada card
        final angle = (2 * pi / members.length) * index;
        const radius = 140.0; // Distância do centro

        return Transform.translate(
          offset: Offset(
            radius * cos(angle), // X baseado no ângulo
            radius * sin(angle), // Y baseado no ângulo
          ),
          child: GestureDetector(
            onTap: () {
              // Adicione navegação aqui, ex.: Navigator.push(...)
            },
            child: TeamCard(member: member),
          ),
        );
      }).toList(),
    );
  }
}

class TeamCard extends StatelessWidget {
  final TeamMember member;

  const TeamCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsApp.primary, width: 2),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: ColorsApp.primary.withValues(
              alpha: 0.5,
            ),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              member.imageUrl,
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            member.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String imageUrl;

  TeamMember({required this.name, required this.imageUrl});
}
