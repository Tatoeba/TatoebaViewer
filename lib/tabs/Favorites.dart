import 'package:flutter/material.dart';
import '../elements/EmptyState.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Favorites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: GREEN,
      child: SafeArea(
        child: EmptyState(title: 'No favorites yet', subtitle: 'Add some sentences to conveniently access them, even offline', iconName: Icons.favorite_border)
      ),
    );
  }
}