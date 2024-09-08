import 'dart:io';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  final String videoPath;
  final String? thumbnailPath;

  const UploadPage({Key? key, required this.videoPath, this.thumbnailPath})
      : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (widget.thumbnailPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.thumbnailPath!),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Caption',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Upload logic
              },
              child: const Text('Upload Video'),
            ),
          ],
        ),
      ),
    );
  }
}
