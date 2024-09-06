import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ThingyPage extends StatelessWidget {
  final String assetPath;

  const ThingyPage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    PdfController pdfController = PdfController(document: PdfDocument.openAsset("assets/pdf/scott_pilgrim_1_pdf.pdf"));
    return Scaffold(
      appBar: AppBar(
        title: Text("${assetPath.replaceAll("assets/pdf/", "")}"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: PdfView(controller: pdfController)),
            Row(
              children: [
                TextButton(
                    onPressed: () =>
                        pdfController.nextPage(duration: const Duration(milliseconds: 10), curve: Curves.bounceIn),
                    child: const Text('NEXT')),
                TextButton(
                    onPressed: () =>
                        pdfController.previousPage(duration: const Duration(milliseconds: 10), curve: Curves.bounceIn),
                    child: const Text('PREVIOUS')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
