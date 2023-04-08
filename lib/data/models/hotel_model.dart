class HotelModel {
  const HotelModel(
      {required this.hotelName,
      required this.hotelImage,
      required this.location,
      required this.awayKilometer,
      required this.stars,
      required this.numberOfReview,
      required this.price});

  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double stars;
  final int numberOfReview;
  final int price;
}
