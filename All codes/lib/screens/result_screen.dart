import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../services/history_service.dart';
import '../services/pdf_service.dart';
import 'history_screen.dart';

class ResultScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  final String imagePath;

  const ResultScreen({
    super.key,
    required this.data,
    required this.imagePath,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    super.initState();

    HistoryService.saveResult({
      ...widget.data,
      "image": widget.imagePath,
    });
  }

  // 🎨 COLOR
  Color getColor(String result) {
    switch (result) {
      case "Mild":
        return Colors.green;
      case "Moderate":
        return Colors.orange;
      case "Severe":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // ⚠️ PRECAUTION MESSAGE
  String getPrecaution(String result) {
    switch (result) {
      case "Mild":
        return "Clean the surface and apply protective coating.";
      case "Moderate":
        return "Remove rust and apply anti-rust treatment.";
      case "Severe":
        return "Immediate repair required to prevent damage.";
      default:
        return "No action required.";
    }
  }

  @override
  Widget build(BuildContext context) {

    String result = widget.data["severity"];
    double percent =
        (widget.data["rust_percentage"] as num).toDouble();

    return Scaffold(
      appBar: AppBar(title: const Text("Result")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // 📸 IMAGE
            Image.file(File(widget.imagePath), height: 200),

            const SizedBox(height: 20),

            // 🎯 RESULT TEXT
            Text(
              result,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: getColor(result),
              ),
            ),

            const SizedBox(height: 10),

            // 📊 PERCENTAGE
            Text(
              "${percent.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            // 📊 PROGRESS BAR
            LinearProgressIndicator(
              value: percent / 100,
              minHeight: 10,
              color: getColor(result),
              backgroundColor: Colors.grey.shade300,
            ),

            const SizedBox(height: 20),

            // ⚠️ PRECAUTION
            Text(
              getPrecaution(result),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            // 🔘 BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Try Another Image"), // ✅ changed
                ),

                ElevatedButton(
                  onPressed: () {
                    Share.shareXFiles(
                      [XFile(widget.imagePath)],
                      text: "$result\n${percent.toStringAsFixed(1)}%",
                    );
                  },
                  child: const Text("Share"),     
                ),

                ElevatedButton(
                  onPressed: () {
                    PdfService.generatePdf(
                      imagePath: widget.imagePath,
                      severity: result,
                      percentage: percent,
                    );
                  },
                  child: const Text("PDF"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HistoryScreen(),
                  ),
                );
              },
              child: const Text("History"),
            )
          ],
        ),
      ),
    );
  }
}