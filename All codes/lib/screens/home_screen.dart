import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/api_service.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  File? image;
  bool loading = false;
  final picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);

    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  Future detect() async {
    if (image == null) return;

    setState(() => loading = true);

    var data = await ApiService.detectRust(image!.path);

    setState(() => loading = false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          data: data,
          imagePath: image!.path,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rust AI")),

      body: Column(
        children: [

          Expanded(
            child: image != null
                ? Image.file(image!)
                : const Center(child: Text("Select Image")),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: const Text("Gallery")),
              ElevatedButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  child: const Text("Camera")),
            ],
          ),

          ElevatedButton(
            onPressed: detect,
            child: const Text("Analyze"),
          ),
        ],
      ),
    );
  }
}