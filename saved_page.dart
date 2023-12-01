import 'package:flutter/material.dart';

/// saved page
class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Saved",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Column(
        children: [
          // 검색
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "저장된 항목 내 검색",
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
                        // 검색 버튼 클릭 시
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 좋아요 싫어요 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      // 좋아요 버튼 클릭 시
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_down),
                    onPressed: () {
                      // 싫어요 버튼 클릭 시
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
