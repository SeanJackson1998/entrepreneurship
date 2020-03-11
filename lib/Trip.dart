class Trip {
  int tripId;
  int driverId;
  String name;
  String destination;
  int timestamp;
  double rating;
  int passengers;
  int luggage;

  Trip(
      {this.tripId,
      this.driverId,
      this.name,
      this.destination,
      this.timestamp,
      this.rating,
      this.passengers,
      this.luggage});

  factory Trip.fromJson(Map<String, dynamic> parsedJson) {
    return Trip(
        tripId: parsedJson['tripId'],
        driverId: parsedJson['driverId'],
        name: parsedJson['name'],
        destination: parsedJson['destination'],
        timestamp: parsedJson['timestamp'],
        rating: parsedJson['rating'],
        passengers: parsedJson['passengers'],
        luggage: parsedJson['luggage']);
  }
}
