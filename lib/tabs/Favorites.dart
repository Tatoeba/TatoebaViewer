import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tatoeba_viewer/elements/Sentence.dart';
import '../Database.dart';
import '../elements/EmptyState.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  List<Favorite> favorites = [];

  Future<void> getFavorites() async {
    List<Favorite> localfavorites = await Favorite.favorites();
    setState(() {
      favorites = localfavorites;
    });
  }

  @override
  void initState() {
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREEN,
      child: SafeArea(
          child: ListView(
            children:
            favorites.length > 0?
              favorites.map((e) => Sentence.fromJson(json.decode(e.jsonData), addedFav: true,)).toList() :
             [Center(child: EmptyState(title: 'No favorites yet', subtitle: 'Add some sentences to conveniently access them, even offline', iconName: Icons.favorite_border))],
          )
      ),
    );
  }
}