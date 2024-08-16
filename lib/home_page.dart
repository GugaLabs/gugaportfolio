import 'package:flutter/material.dart';
import 'package:guga_portfolio/colors.dart';
import 'package:guga_portfolio/widgets/profile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blue,
      body: ListView(
        children: [
          Column(
            children: [
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
    );
  }
}
