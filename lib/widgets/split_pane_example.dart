import 'package:flutter/material.dart';
import 'package:guga_portfolio/widgets/split_pane.dart'; // Importe o SplitPane

class SplitPaneExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo de SplitPane")),
      body: Center(
        child: SplitPane(
          axis: Axis.horizontal, // Escolha o eixo de layout
          children: [
            Container(
              color: Colors.blue,
              child: Center(
                  child:
                      Text("Painel 1", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.green,
              child: Center(
                  child:
                      Text("Painel 2", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.red,
              child: Center(
                  child:
                      Text("Painel 3", style: TextStyle(color: Colors.white))),
            ),
          ],
          initialFractions: [
            0.3,
            0.4,
            0.3
          ], // Frações iniciais para cada painel
          minSizes: [100.0, 100.0, 100.0], // Tamanho mínimo para cada painel
        ),
      ),
    );
  }
}
