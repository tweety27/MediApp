import 'package:flutter/material.dart';

/// home page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 문구
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

          // 검색
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "약품명을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                // 아이콘 버튼들
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // 돋보기 버튼 클릭 시
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        // 카메라 버튼 클릭 시
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
}
