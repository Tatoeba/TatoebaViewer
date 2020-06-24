import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/elements/Sentence.dart';
import 'package:mobile/notifiers/SearchResultsNotifier.dart';
import 'package:mobile/serializers/SentenceSerializer.dart';
import 'package:provider/provider.dart';
import '../elements/EmptyState.dart';
import '../elements/Sentence.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Results extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREEN,
      child: SafeArea(
        child: Consumer<SearchResultsNotifier>(
          builder: (context, results, child) {
            return
              results.sentences.length > 0?
              ListView(children:
              <Widget>[Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(results.sentences.length.toString() + " results", style: TextStyle(
                  color: Colors.white, fontSize: 20,
                ),),
              )] +
                  results.sentences.map((sentence_data) => Sentence(sentence_data)).toList()
            ,) :
                  // ELSE
            EmptyState(title: 'Search something', subtitle: 'In this section the searched sentences will appear', iconName: Icons.list);
            ;
          },
        )
      ),
    );
  }
}