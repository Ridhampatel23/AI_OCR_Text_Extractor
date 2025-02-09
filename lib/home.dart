import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';
  File? image;
  ImagePicker imagePicker = ImagePicker();

  pickImageFromGallery() async {
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        performImageLabeling();
      });
    }
  }

  pickImageFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        performImageLabeling();
      });
    }
  }

  performImageLabeling() async {
    if (image == null) return;

    final InputImage inputImage = InputImage.fromFile(image!);
    final TextRecognizer textRecognizer = GoogleMlKit.vision.textRecognizer();

    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    result = '';

    setState(() {
      for (TextBlock block in recognizedText.blocks) {
        result += block.text + "\n\n";
      }
    });

    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Notepad.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(width: 100),
            Container(
              height: 280,
              width: 250,
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.only(left: 28, bottom: 5, right: 18),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Notepad.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    result,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 140),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/Pin.png',
                      height: 240,
                      width: 240,
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: pickImageFromGallery,
                      onLongPress: pickImageFromCamera,
                      child: Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: image != null
                            ? Image.file(
                          image!,
                          width: 140,
                          height: 192,
                          fit: BoxFit.fill,
                        )
                            : Container(
                          width: 240,
                          height: 200,
                          child: const Icon(
                            Icons.camera_enhance_sharp,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
