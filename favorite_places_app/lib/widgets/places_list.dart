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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: plases.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(plases[index].image),
          ),
          title: Text(
            plases[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            plases[index].location.address,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
      ),
    );
  }
}
