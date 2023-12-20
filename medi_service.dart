import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'medi_info.dart';

class MediService extends ChangeNotifier {
  // 의약품 목록
  List<MediInfo> mediList = [];

  // 검색어로 의약품 정보 불러오기
  void getMediList(String q) async {
    mediList.clear(); // 기존에 들어있는 데이터 초기화

    //API 호출
    Response res = await Dio().get(
        "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=30&pageNo=1&numOfRows=3&entpName=&itemName=&itemSeq=&efcyQesitm=&useMethodQesitm=&atpnWarnQesitm=&atpnQesitm=&intrcQesitm=&seQesitm=&depositMethodQesitm=&openDe=&updateDe=&type=xml");
    List items = res.data["items"];
    for (Map<String, dynamic> item in items) {
      Map<String, dynamic> volumeInfo = item["volumeInfo"];
      MediInfo mediInfo = MediInfo.fromJson(volumeInfo);
      mediList.add(mediInfo);
    }
    notifyListeners();
  }
}
