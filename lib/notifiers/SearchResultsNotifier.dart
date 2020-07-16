import 'package:flutter/material.dart';
import 'package:tatoeba_viewer/elements/Sentence.dart';
import 'package:tatoeba_viewer/elements/Sentence.dart';

class SearchResultsNotifier extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<Sentence> _sentences = [];

  List<Sentence> get sentences => _sentences;

  void replaceAll(List<Sentence> sentences) {
    _sentences = sentences;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}