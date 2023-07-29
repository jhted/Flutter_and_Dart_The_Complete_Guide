import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart' as sqlapi;

import 'package:favorite_places_app/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDri = await  syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(appDri.path);
    final copiedImage = await image.copy('${appDri.path}/$filename');

    final newPlace = Place(
      title: title,
      image: copiedImage,
      location: location,
    );

    //sql.

    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
