import 'package:flutter/material.dart';
import 'package:guga_portfolio/colors.dart';
import 'package:guga_portfolio/widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackLogo,
      body: Stack(
        children: [
          // Fundo com o corte diagonal
          Container(
            color: Colors.white, // Cor de fundo da sua página
            child: ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                color: ColorsApp.blackLogo, // Cor do corte diagonal
              ),
            ),
          ),

          // Conteúdo da página em um ListView
          ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to ",
                        style: TextStyle(
                          fontSize: 30,
                          color: ColorsApp.bluelogo1,
                        ),
                      ),
                      Text(
                        'GugaLabs!',
                        style: TextStyle(
                          fontSize: 30,
                          color: ColorsApp.bluelogo2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        "assets/images/logo_labs.png",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileWidget(
                        title: 'Mobile Developer',
                        photoPath: "assets/images/gabriel.png",
                        name: 'Gabriel Donato',
                        description: 'Olá eu sou o Gabriel',
                      ),
                      ProfileWidget(
                        title: 'Mobile Developer',
                        photoPath: "assets/images/gustavo.png",
                        name: 'Gustavo Silva',
                        description: 'Olá eu sou o Gustavo',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height) // Começa no canto inferior esquerdo
      ..lineTo(size.width, 0.0) // Vai para o canto superior direito
      ..close(); // Fecha o path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
