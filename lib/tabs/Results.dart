import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/elements/Sentence.dart';
import 'package:mobile/serializers/SentenceSerializer.dart';
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
            Sentence(SentenceSerializer.fromJson(json.decode(jSON))),
          ],
        )
        //EmptyState(title: 'Search something', subtitle: 'In this section the searched sentences will appear', iconName: Icons.list),
      ),
    );
  }

  String jSON = '{"id": 1, "text": "I am an example!", "language": "eng", "author": "Quielin", "translations": [{"id": 2, "text": "我是个例子！", "language": "zhi", "author": "Aday"}, {"id": 3, "text": "Eu soy uno ejemplo!", "language": "ita", "author": "Trang"}]}';
}