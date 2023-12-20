class MediInfo {
  String itemName;
  String itemImage;

  MediInfo({
    required this.itemName,
    required this.itemImage,
  });

  factory MediInfo.fromJson(Map<String, dynamic> volumeInfo) {
    return MediInfo(
      itemName: volumeInfo["itemName"] ?? "",
      itemImage: volumeInfo["itemImage"] ?? "",
    );
  }
}
