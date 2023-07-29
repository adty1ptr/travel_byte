import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/model.dart';

class DestinationService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }

  List<DestinationModel> dummyDestinations = [
    const DestinationModel(
      id: "1",
      name: "Lake Ciliwung",
      city: "Tangerang",
      price: 2500000,
      rating: 4.8,
      imageUrl: "assets/destinations/image 8.png",
    ),
    const DestinationModel(
      id: "2",
      name: "White House",
      city: "Spain",
      price: 3500000,
      rating: 4.7,
      imageUrl: "assets/destinations/image 7.png",
    ),
    const DestinationModel(
      id: "3",
      name: "Hill Heyo",
      city: "Monaco",
      price: 4500000,
      rating: 4.8,
      imageUrl: "assets/destinations/image 16.png",
    ),
    const DestinationModel(
      id: "4",
      name: "Menarra",
      city: "Japan",
      price: 2500000,
      rating: 4.7,
      imageUrl: "assets/destinations/image 17.png",
    ),
    const DestinationModel(
      id: "2",
      name: "Payung Teduh",
      city: "Singapore",
      price: 3000000,
      rating: 4.8,
      imageUrl: "assets/destinations/image 18.png",
    ),
  ];
}
