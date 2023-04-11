class RoomModel {
  RoomModel(
      {required this.roomName,
      required this.roomArea,
      required this.roomPrice,
      required this.roomImage,
      required this.roomUtility});
  final String roomName;
  final int roomArea;
  final int roomPrice;
  final String roomImage;
  final String roomUtility;
}
