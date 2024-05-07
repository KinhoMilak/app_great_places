import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/util/app_routs.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouts.placeForm);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<GreatePlaces>(
                    child: Center(
                      child: Text('nenhum local'),
                    ),
                    builder: (ctx, greatPlace, ch) => greatPlace.itemsCount == 0
                        ? ch!
                        : ListView.builder(
                            itemCount: greatPlace.itemsCount,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlace.itemByIndex(i).image,
                                ),
                              ),
                              title: Text(
                                greatPlace.itemByIndex(i).title,
                              ),
                              onTap: () {},
                            ),
                          ),
                  ),
      ),
    );
  }
}
