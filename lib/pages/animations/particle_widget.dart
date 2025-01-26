import 'dart:math';
import 'package:flutter/material.dart';

class Particle {
  Offset position;
  Offset velocity;
  double size;
  Color color;
  double opacity;
  double rotationAngle;
  bool isLiquid;

  Particle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.color,
    this.opacity = 1.0,
    this.rotationAngle = 0.0,
    this.isLiquid = false,
  });

  void update(Size screenSize) {
    position = position + velocity;
    rotationAngle += 0.05;

    // Efeito de desvanecimento para as partículas líquidas e não líquidas
    opacity = max(opacity - 0.01, 0.1);

    // Reposição das partículas quando saem da tela
    if (position.dy > screenSize.height ||
        position.dy < 0 ||
        position.dx > screenSize.width ||
        position.dx < 0) {
      position = Offset(Random().nextDouble() * screenSize.width,
          Random().nextDouble() * screenSize.height);
      velocity =
          Offset(Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1);
      opacity = 1.0; // Resetando a opacidade
    }

    if (isLiquid) {
      // Efeito para partículas líquidas que caem para baixo
      if (position.dy > screenSize.height) {
        position = Offset(
            Random().nextDouble() * screenSize.width, 0); // Resetando no topo
      }
    }
  }
}

class ParticlesPainter extends CustomPainter {
  final List<Particle> particles;
  final Size screenSize;

  ParticlesPainter(this.particles, this.screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    for (var particle in particles) {
      paint.color = particle.color.withOpacity(particle.opacity);

      if (particle.isLiquid) {
        // Desenhando como se fosse um líquido, usando círculos com opacidade
        canvas.drawCircle(particle.position, particle.size, paint);
      } else if (particle.size < 5) {
        // Desenhando como bolinhas pequenas (pode ser para átomos ou partículas pequenas)
        canvas.drawCircle(particle.position, particle.size, paint);
      } else {
        // Desenhando como um átomo (círculo com órbitas)
        canvas.save();
        canvas.translate(particle.position.dx, particle.position.dy);
        canvas.rotate(particle.rotationAngle);

        final Path atomPath = Path();
        final int orbitCount = 3;
        for (int i = 0; i < orbitCount; i++) {
          final radius = particle.size * (i + 1) / orbitCount;
          atomPath
              .addOval(Rect.fromCircle(center: Offset.zero, radius: radius));
        }
        paint.style = PaintingStyle.stroke;
        canvas.drawPath(atomPath, paint);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ParticlesBackground extends StatefulWidget {
  final Widget child;

  const ParticlesBackground({Key? key, required this.child}) : super(key: key);

  @override
  _ParticlesBackgroundState createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles = []; // Inicializando com uma lista vazia
  late Size _screenSize;

  @override
  void initState() {
    super.initState();

    // Controlador de animação
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(_updateParticles)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Particle> _generateParticles(Size screenSize, int count) {
    final List<Particle> particles = [];
    final random = Random();

    for (int i = 0; i < count; i++) {
      bool isLiquid = random.nextBool(); // Define se a partícula é líquida
      double size = random.nextDouble() * 6 + 3;
      Color color = _getParticleColor(random);

      // Ajustamos para espalhar as partículas por toda a área disponível
      particles.add(Particle(
        position: Offset(
            random.nextDouble() * screenSize.width,
            random.nextDouble() *
                screenSize.height), // Usando o tamanho da tela
        velocity:
            Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1),
        size: size,
        color: color,
        isLiquid: isLiquid,
      ));
    }

    return particles;
  }

  Color _getParticleColor(Random random) {
    // Usando tons de azul, com a cor primária como base
    List<Color> colors = [
      Color(0xff38b6ff), // Cor primária
      Color(0xff80cfff), // Azul claro
      Color(0xff4da3ff), // Azul intermediário
      Color(0xff1f7fc1), // Azul escuro
    ];
    return colors[random.nextInt(colors.length)];
  }

  void _updateParticles() {
    setState(() {
      for (var particle in _particles) {
        particle.update(_screenSize);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    if (_particles.isEmpty) {
      _particles = _generateParticles(
          _screenSize, 200); // Aumentamos o número de partículas
    }

    return Stack(
      children: [
        // Animação das partículas
        Positioned.fill(
          child: CustomPaint(
            painter: ParticlesPainter(_particles, _screenSize),
          ),
        ),
        // O conteúdo filho
        widget.child,
      ],
    );
  }
}
