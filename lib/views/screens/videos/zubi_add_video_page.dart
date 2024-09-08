import 'dart:io';
import 'package:amazon_s3_cognito/image_data.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as cam;
import 'package:image_picker/image_picker.dart';
import 'package:amazon_s3_cognito/amazon_s3_cognito.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart' as thumb;
import 'package:path_provider/path_provider.dart';
import 'package:zubi/views/screens/add_video_screen.dart';
import 'package:zubi/views/screens/videos/search_music_page(2).dart';

class ZubiAddNewVideoPage extends StatefulWidget {
  const ZubiAddNewVideoPage({super.key});

  @override
  _ZubiAddNewVideoPage createState() => _ZubiAddNewVideoPage();
}

class _ZubiAddNewVideoPage extends State<ZubiAddNewVideoPage> {
  cam.CameraController? _cameraController;
  VideoPlayerController? _videoPlayerController;
  XFile? _videoFile;
  String? _uploadedVideoUrl;
  String? _thumbnailPath;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  void initializeCamera() async {
    final cameras = await cam.availableCameras();
    _cameraController =cam.CameraController(cameras[0], cam.ResolutionPreset.high);
    await _cameraController?.initialize();
    setState(() {});
  }

  Future<void> recordVideo() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        // Start recording the video
        await _cameraController?.startVideoRecording();

        // Wait for specific duration
        await Future.delayed(const Duration(seconds: 10));

        // Stop recording and get the file
        final XFile videoFile = await _cameraController!.stopVideoRecording();

        // Generate a thumbnail and upload video
        await _generateThumbnail(videoFile.path);
        uploadFileToS3(videoFile.path);

        // Navigate to the upload screen
        navigateToUploadPage(videoFile.path, _thumbnailPath);
      } catch (e) {
        print("Error during video recording: $e");
      }
    }
  }

  Future<void> pickVideoFromDevice() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = pickedFile;
      });
      await _generateThumbnail(pickedFile.path);
      uploadFileToS3(pickedFile.path);

      // Navigate to upload page
      navigateToUploadPage(pickedFile.path, _thumbnailPath);
    }
  }

  Future<void> pickFileFromDrive() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      final file = result.files.first;
      await _generateThumbnail(file.path!);
      uploadFileToS3(file.path!);

      // Navigate to upload page
      navigateToUploadPage(file.path!, _thumbnailPath);
    }
  }

  Future<void> uploadFileToS3(String filePath) async {
    final uploadedUrl = await AmazonS3Cognito.upload(
      filePath,
      "your-s3-bucket",
      "your-cognito-identity-pool-id",
      "your-s3-upload-directory",
      "file-name" as ImageData,
    );
    setState(() {
      _uploadedVideoUrl = uploadedUrl;
    });
  }

  // Generate thumbnail for the video
  Future<void> _generateThumbnail(String videoPath) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;

    final thumbnailPath = await thumb.VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: tempPath,
      imageFormat: thumb.ImageFormat.PNG,
      maxHeight: 150,
      quality: 75,
    );
    setState(() {
      _thumbnailPath = thumbnailPath;
    });
  }

  void navigateToUploadPage(String videoPath, String? thumbnailPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadPage(
          videoPath: videoPath,
          thumbnailPath: thumbnailPath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (_cameraController != null &&
              _cameraController!.value.isInitialized)
           cam.CameraPreview(_cameraController!),
          if (_videoPlayerController != null &&
              _videoPlayerController!.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.music_note, color: Colors.white, size: 40),
                      onPressed: () {
                        // Open music picker
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchForMusicPage()),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: recordVideo,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.videocam, color: Colors.white, size: 40),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.upload_file,
                          color: Colors.white, size: 40),
                      onPressed: pickFileFromDrive,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: pickVideoFromDevice,
                  child: const Text(
                    "Upload from Gallery",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: TextButton(
              onPressed: () {
                // Navigate to the next step
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadPage(videoPath: "")),
                );
              },
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.purple, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
