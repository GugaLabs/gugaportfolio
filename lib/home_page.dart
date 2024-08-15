import 'package:flutter/material.dart';
import 'package:guga_portfolio/widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            shape: Border.all(),
            margin: const EdgeInsets.all(0),
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileWidget(
                      title: 'Mobile Developer',
                      photoPath: "assets/images/gabriel.jpg",
                      name: 'Gabriel Donato',
                      description: 'Olá eu sou o Gabriel',
                    ),
                    ProfileWidget(
                      title: 'Mobile Developer',
                      photoPath: "assets/images/gustavo.jpg",
                      name: 'Gustavo Silva',
                      description: 'Olá eu sou o Gustavo',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
