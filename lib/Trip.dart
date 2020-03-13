class Trip {
  int tripId;
  int driverId;
  String name;
  String destination;
  String timestamp;
  double rating;
  int passengers;
  int luggage;
  double price;
  String phone;

  Trip(
      {this.tripId,
      this.driverId,
      this.name,
      this.destination,
      this.timestamp,
      this.rating,
      this.passengers,
      this.luggage,
      this.price,
      this.phone});

  factory Trip.fromJson(Map<String, dynamic> parsedJson) {
    return Trip(
        tripId: parsedJson['tripId'],
        driverId: parsedJson['driverId'],
        name: parsedJson['name'],
        destination: parsedJson['destination'],
        timestamp: parsedJson['timestamp'],
        rating: parsedJson['rating'],
        passengers: parsedJson['passengers'],
        luggage: parsedJson['luggage'],
        price: parsedJson['price'],
        phone: parsedJson['phone']);
  }
}
