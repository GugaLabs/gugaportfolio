import 'dart:math';
import 'package:flutter/material.dart';

class Molecule {
  Offset position;
  Offset velocity;
  double size;
  Color color;
  Offset direction;
  double bounceFactor; // Fator de retorno para simular elasticidade

  Molecule({
    required this.position,
    required this.velocity,
    required this.size,
    required this.color,
    required this.direction,
    this.bounceFactor = 0.8, // Controlando o quão "elásticas" as moléculas são
  });

  void update(Size screenSize) {
    position += velocity;

    // Movimento baseado na direção (interação entre as partículas)
    velocity = Offset(
      velocity.dx + direction.dx * 0.05,
      velocity.dy + direction.dy * 0.05,
    );

    // Efeito de retorno para a tela (bounce)
    if (position.dx > screenSize.width || position.dx < 0) {
      direction = Offset(-direction.dx, direction.dy);
      velocity = velocity * bounceFactor; // Diminui a velocidade ao bater
    }

    if (position.dy > screenSize.height || position.dy < 0) {
      direction = Offset(direction.dx, -direction.dy);
      velocity = velocity * bounceFactor; // Diminui a velocidade ao bater
    }
  }
}

class MoleculesPainter extends CustomPainter {
  final List<Molecule> molecules;

  MoleculesPainter(this.molecules);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    for (var molecule in molecules) {
      paint.color = molecule.color;
      canvas.drawCircle(molecule.position, molecule.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MoleculesBackground extends StatefulWidget {
  final Widget child;

  const MoleculesBackground({Key? key, required this.child}) : super(key: key);

  @override
  _MoleculesBackgroundState createState() => _MoleculesBackgroundState();
}

class _MoleculesBackgroundState extends State<MoleculesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Molecule> _molecules;
  late Size _screenSize;

  @override
  void initState() {
    super.initState();

    // Controlador de animação
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(_updateMolecules)
      ..repeat();

    _molecules = _generateMolecules(50); // Ajustando o número de moléculas
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Molecule> _generateMolecules(int count) {
    final List<Molecule> molecules = [];
    final random = Random();

    for (int i = 0; i < count; i++) {
      // Moléculas em movimento, criando moléculas em posições aleatórias
      double size = random.nextDouble() * 6 + 5;
      Color color = Color(0xff38b6ff); // Usando a cor primária
      Offset position =
          Offset(random.nextDouble() * 800, random.nextDouble() * 600);
      Offset velocity =
          Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
      Offset direction =
          Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);

      molecules.add(Molecule(
          position: position,
          velocity: velocity,
          size: size,
          color: color,
          direction: direction));
    }

    return molecules;
  }

  void _updateMolecules() {
    setState(() {
      for (var molecule in _molecules) {
        molecule.update(
            _screenSize); // Atualiza as moléculas com base no tamanho da tela
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Animação das moléculas
        Positioned.fill(
          child: CustomPaint(
            painter: MoleculesPainter(_molecules),
          ),
        ),
        // O conteúdo filho
        widget.child,
      ],
    );
  }
}
