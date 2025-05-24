import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _hasCamera = false;
  String _errorMessage = 'Checking camera availability...';

  @override
  void initState() {
    super.initState();
    _checkCameraAvailability();
  }

  Future<void> _checkCameraAvailability() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() {
          _hasCamera = false;
          _errorMessage = 'No cameras available on this device';
        });
      } else {
        setState(() {
          _hasCamera = true;
        });
        // Proceed with camera initialization if needed
      }
    } catch (e) {
      setState(() {
        _hasCamera = false;
        _errorMessage = 'Failed to check for cameras: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: Center(
        child: _hasCamera
            ? const Text('Camera is available!')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera, size: 64, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              _errorMessage,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Optionally allow image selection from gallery
                // _pickImageFromGallery();
              },
              child: const Text('Select Photo from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}