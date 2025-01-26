import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;

  final List<Particle> _particles = List.generate(100, (_) => Particle());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0.0,
      upperBound: 2 * pi,
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 1),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: BackgroundPainter(_particles),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class Particle {
  double angle = Random().nextDouble() * 2 * pi;
  double radius = Random().nextDouble() * 100 + 50; // Diminuído o tamanho
  double speed = Random().nextDouble() * 0.5 + 0.5;
  Color color = _getRandomBlue(); // Aplicando tons de azul

  static Color _getRandomBlue() {
    final blues = [
      Colors.blue.withOpacity(0.6),
      Colors.blueAccent.withOpacity(0.6),
      Colors.lightBlue.withOpacity(0.6),
      Colors.cyan.withOpacity(0.6),
    ];
    return blues[Random().nextInt(blues.length)];
  }
}

class BackgroundPainter extends CustomPainter {
  final List<Particle> particles;

  BackgroundPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      final x = size.width / 2 + particle.radius * cos(particle.angle);
      final y = size.height / 2 + particle.radius * sin(particle.angle);

      paint.color = particle.color; // Alterando a cor da partícula
      canvas.drawCircle(Offset(x, y), 4, paint); // Partículas um pouco menores

      // Atualiza a posição das partículas
      particle.angle += particle.speed;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
