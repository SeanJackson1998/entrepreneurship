import 'Trip.dart';

class DriverTrip {
  Trip trip;
  List<Passenger> car;
  List<Passenger> requests;

  DriverTrip({
    this.trip,
    this.car,
    this.requests,
  });

  factory DriverTrip.fromJson(Map<String, dynamic> parsedJson) {
    var carList = parsedJson['car'] as List;
    print(carList.runtimeType); //returns List<dynamic>
    List<Passenger> passengerList =
        carList.map((i) => Passenger.fromJson(i)).toList();

    var reqList = parsedJson['requests'] as List;
    print(reqList.runtimeType); //returns List<dynamic>
    List<Passenger> requestList =
        reqList.map((i) => Passenger.fromJson(i)).toList();

    return DriverTrip(
        trip: Trip.fromJson(parsedJson['trip']),
        car: passengerList,
        requests: requestList);
  }
}

//class Car {
//  List<Passenger> passengers;
//
//  Car({this.passengers});
//
//  factory Car.fromJson(Map<String, dynamic> parsedJson) {
//    var list = parsedJson['car'] as List;
//    print(list.runtimeType); //returns List<dynamic>
//    List<Passenger> passengerList =
//        list.map((i) => Passenger.fromJson(i)).toList();
//
//    return Car(passengers: passengerList);
//  }
//}
//
//class Requests {
//  List<Passenger> requests;
//
//  Requests({this.requests});
//
//  factory Requests.fromJson(Map<String, dynamic> parsedJson) {
//    var list = parsedJson['requests'] as List;
//    print(list.runtimeType); //returns List<dynamic>
//    List<Passenger> requestList =
//    list.map((i) => Passenger.fromJson(i)).toList();
//
//    return Requests(requests: requestList);
//  }
//}

class Passenger {
  String name;
  String destination;
  double rating;
  int luggage;
  String phone;

  Passenger(
      {this.name, this.destination, this.rating, this.luggage, this.phone});

  factory Passenger.fromJson(Map<String, dynamic> parsedJson) {
    return Passenger(
        name: parsedJson['name'],
        destination: parsedJson['destination'],
        rating: parsedJson['rating'],
        luggage: parsedJson['luggage'],
        phone: parsedJson['phone']);
  }
}
