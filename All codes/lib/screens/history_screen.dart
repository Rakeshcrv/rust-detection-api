import 'dart:io';
import 'package:flutter/material.dart';
import '../services/history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  List history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  void loadHistory() async {
    var data = await HistoryService.getHistory();
    setState(() => history = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await HistoryService.clearHistory();
              loadHistory();
            },
          )
        ],
      ),

      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (_, i) {

          var item = history[i];

          return ListTile(
            leading: Image.file(File(item["image"])),
            title: Text(item["severity"]),
            subtitle: Text("${item["rust_percentage"]}%"),
          );
        },
      ),
    );
  }
}