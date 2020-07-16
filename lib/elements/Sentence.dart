import 'package:flutter/material.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

import '../Database.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class AddFavorite extends StatefulWidget {
  final bool added;
  final Sentence sentence;

  AddFavorite({this.sentence, this.added});

  @override
  _AddFavoriteState createState() => _AddFavoriteState();
}

class _AddFavoriteState extends State<AddFavorite> {

  bool added = false;
  Favorite favorite;

  @override
  void initState() {
    added = widget.added;
    super.initState();
  }

  saveFavorite() async {
    favorite = Favorite(
      id: widget.sentence.id,
      //TODO: probably is better to save the map and then transform it to json
      jsonData: '{"id": ${widget.sentence.id}, "text": "${widget.sentence.text}", "language": "${widget.sentence.language}", "author": "${widget.sentence.author}", "translations": [{"id": 2, "text": "我是个例子！", "language": "zhi", "author": "Aday"}, {"id": 3, "text": "Eu soy uno ejemplo!", "language": "ita", "author": "Trang"}]}',
    );
    await favorite.insert();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!added) {
          await saveFavorite();
          setState(() {
            added = true;
          });
          print("agregado a favoritos");
        } else {
          await Favorite.delete(widget.sentence.id);
          setState(() {
            added = false;
          });
        }
      },
      child: Icon(
        !added? Icons.favorite_border : Icons.favorite,
        color: GREEN,
        size: 25,
      ),
    );
  }
}


class Sentence extends StatelessWidget {

  final int id;
  final String text;
  final String language;
  final String author;
  final List<Sentence> translations;
  final bool added;

  Sentence({this.id, this.author, this.text, this.language, this.translations, this.added = false});

  factory Sentence.fromJson(Map<String, dynamic> json, {addedFav = false}) {
    List<Sentence> localTranslations = [];
    if (json.containsKey('translations')) {
      List<dynamic> translations2Serialize = json['translations'];
      translations2Serialize.forEach((translation2Serialize) {
        localTranslations.add(Sentence.fromJson(translation2Serialize));
      });
    }
    return Sentence(
      id: json['id'],
      text: json['text'],
      author: json['user'],
      language: json['language'],
      translations: localTranslations,
      added: addedFav,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'img/$language.png',
                  width: 40,
                  height: 40,
                ),
                Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                AddFavorite(sentence: this, added: added),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.open_in_new,
                  color: GREEN,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.content_copy,
                  color: GREEN,
                  size: 25,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              color: GREEN,
            ),
            ] + translations.map((translation) => Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Image.asset(
                  'img/${translation.language}.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Text(
                      translation.text,
                      style: TextStyle(fontSize: 18),
                    )),
                PopupMenuButton<String>(
                    onSelected: (choice) {
                      print(choice);
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: GREEN,
                      size: 25,
                    ),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'copy',
                        child: ListTile(
                          leading: Icon(
                            Icons.content_copy,
                            color: GREEN,
                            size: 25,
                          ),
                          title: Text(
                            'Copy',
                            style: TextStyle(
                                color: GREEN, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'open',
                        child: ListTile(
                          leading: Icon(
                            Icons.open_in_new,
                            color: GREEN,
                            size: 25,
                          ),
                          title: Text(
                            'Open',
                            style: TextStyle(
                                color: GREEN, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ])
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),).toList() + [
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '5 other translations',
                    style: TextStyle(
                        color: GREEN, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: GREEN,
                    size: 25,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
