import 'package:flutter/material.dart';
import 'package:mobile/elements/Sentence.dart';
import '../elements/EmptyState.dart';
import '../elements/Sentence.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Results extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      color: GREEN,
      child: SafeArea(
        child: Column(
          children: [
            Sentence(),
          ],
        )
        //EmptyState(title: 'Search something', subtitle: 'In this section the searched sentences will appear', iconName: Icons.list),
      ),
    );
  }
}