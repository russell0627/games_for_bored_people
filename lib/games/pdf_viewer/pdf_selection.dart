import 'package:flutter/material.dart';

class PdfSelection extends StatelessWidget {
  const PdfSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListView(
              children: [
                ListTile(
                  title: Text("Scott Pilgrim 1"),

                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
