import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';
import 'medi_service.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final List<CameraDescription> cameras;

  HomePage({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Medi',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login, color: Colors.black),
            onPressed: () {
              // 로그인 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              bottom: 30,
              left: 8,
              right: 8,
            ),
            child: Text(
              "궁금한 의약품을\n검색하세요!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "약품명을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _navigateToSearchPage(context, searchController.text);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        _handleCameraButton(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context, String searchQuery) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchPage(
          searchQuery: searchQuery,
          mediService: MediService(),
        ),
      ),
    );
  }

  void _handleCameraButton(BuildContext context) async {
    try {
      final XFile image = await _takePicture();

      // 이미지를 서버에 업로드
      await HomePage.uploadImageToServer(File(image.path));

      // 업로드가 성공하면 필요한 동작 수행
    } catch (e) {
      print('Error taking/uploading picture: $e');
    }
  }

  Future<XFile> _takePicture() async {
    final CameraController controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await controller.initialize();
    final XFile image = await controller.takePicture();
    await controller.dispose();
    return image;
  }

  static Future<void> uploadImageToServer(File imageFile) async {
    try {
      var uri = Uri.parse('https://91de-1-209-144-250.ngrok-free.app');

      var request = http.MultipartRequest('POST', uri)
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            await imageFile.readAsBytes(),
            filename: 'sample_image.png',
          ),
        );

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded to server successfully');
        // 서버 응답을 처리하고 필요한 동작 수행
      } else {
        print('Failed to upload image to server');
      }
    } catch (error) {
      print('Error uploading image to server: $error');
    }
  }
}
