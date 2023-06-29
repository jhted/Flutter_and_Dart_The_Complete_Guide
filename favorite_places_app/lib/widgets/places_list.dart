import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.plases});

  final List<Place> plases;

  @override
  Widget build(BuildContext context) {
    if (plases.isEmpty) {
      return Center(
        child: Text(
          "No places added yet",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: plases.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          plases[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailScreen(place: plases[index]),
            ),
          );
        },
      ),
    );
  }
}
