import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfService {

  static Future generatePdf({
    required String imagePath,
    required String severity,
    required double percentage,
  }) async {

    final pdf = pw.Document();

    final image = pw.MemoryImage(
      File(imagePath).readAsBytesSync(),
    );

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [

            pw.Text("Rust Detection Report",
                style: pw.TextStyle(fontSize: 24)),

            pw.SizedBox(height: 20),

            pw.Image(image, height: 200),

            pw.SizedBox(height: 20),

            pw.Text("Severity: $severity"),
            pw.Text("Rust: ${percentage.toStringAsFixed(1)}%"),
            pw.Text("Date: ${DateTime.now()}"),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}