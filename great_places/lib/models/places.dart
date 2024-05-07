import 'dart:io';

import 'package:flutter/material.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? adress;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.adress,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.image,
    this.location,
    this.title,
  });
}
