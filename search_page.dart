import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi/medi_info.dart';
import 'package:medi/medi_service.dart';

class SearchPage extends StatelessWidget {
  // Receive the MediService instance through the constructor
  final MediService mediService;

  // Constructor that initializes the mediService
  SearchPage({Key? key, required this.mediService, required String searchQuery})
      : super(key: key);

  final TextEditingController searchController = TextEditingController();

  // 검색을 위한 메소드
  void search(MediService mediService) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      mediService.getMediList(keyword);
      //print('검색어: $keyword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Search Page",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // 검색 창
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "약품명을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                // 검색 버튼 아이콘
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // 검색 버튼 클릭 시
                        search(mediService);
                      },
                    ),
                  ],
                ),
              ),
              // 검색어를 관리하는 컨트롤러
              controller: searchController,
            ),
          ),
          // 검색 결과 표시
          Expanded(
            child: mediService.mediList.isEmpty
                ? Center(
                    child: Text(
                      "검색어를 입력해 주세요",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: mediService.mediList.length, // 실제 검색 결과 개수로 변경
                    itemBuilder: (context, index) {
                      MediInfo mediInfo = mediService.mediList[index];
                      // 검색 결과 항목을 나타내는 ListTile
                      return ListTile(
                        // 이미지를 네트워크에서 가져와서 표시
                        leading: Image.network(
                          mediInfo.itemImage, // 실제 이미지 URL로 변경
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(mediInfo.itemName), // 실제 항목 이름으로 변경
                        onTap: () {
                          // 검색 결과 항목을 탭했을 때의 동작 추가
                          //print('검색 결과 항목 $index 탭됨');
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
