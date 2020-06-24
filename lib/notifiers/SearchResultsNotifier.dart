import 'package:flutter/material.dart';
import 'package:mobile/serializers/SentenceSerializer.dart';

class SearchResultsNotifier extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<SentenceSerializer> _sentences = [];

  List<SentenceSerializer> get sentences => _sentences;

  void replaceAll(List<SentenceSerializer> sentences) {
    _sentences = sentences;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}