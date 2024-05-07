import 'dart:core';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/places.dart';
import '../util/db_util.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place iconButtonThemeData(int index) {
    return _items[index];
  }

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (e) => Place(
            id: e['id'],
            image: e['image'],
            location: null,
            title: e['title'],
          ),
        )
        .toList();
    notifyListeners();
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);

    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners();
  }

  Place itemByIndex(int index) {
    return _items[index];
  }
}
