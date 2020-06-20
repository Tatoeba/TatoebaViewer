class SentenceSerializer {

  final int id;
  final String text;
  final String author;
  final String language;
  final List<SentenceSerializer> translations;

  SentenceSerializer({this.id, this.author, this.text, this.language, this.translations});

  factory SentenceSerializer.fromJson(Map<String, dynamic> json) {
    List<SentenceSerializer> localTranslations = [];
    if (json.containsKey('translations')) {
      List<dynamic> translations2Serialize = json['translations'];
      translations2Serialize.forEach((translation2Serialize) {
        localTranslations.add(SentenceSerializer.fromJson(translation2Serialize));
      });
    }
    return SentenceSerializer(
      id: json['id'],
      text: json['text'],
      author: json['user'],
      language: json['language'],
      translations: localTranslations,
    );
  }
}