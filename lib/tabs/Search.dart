import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../views/Picker.dart';

bool _lights = true;

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREEN,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              color: GRAY,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tatoeba',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            )),
                        Text('VIEWER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.white,
                            )),

                      ],
                    ),
                  ),
                  SvgPicture.asset('img/tatoeba.svg')
                ],
              ),
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(30, 14, 10, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 25),
                        decoration:
                        InputDecoration(border: InputBorder.none, hintText: 'search'),
                      ),
                    ),
                    Icon(Icons.more_vert, color: GREEN, size: 34,)
                  ],
                )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    OutlineButton(
                        padding: EdgeInsets.all(14),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        child: new Text(
                          "Any of my favorite languages",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Picker()),
                        ),
                        highlightColor: Colors.red,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0))),
                    SwitchListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Translated to favorite language',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      value: _lights,
                      onChanged: (bool value) {},
                    ),

                    Expanded(
                      child: Center(
                        child: Container(
                            width: 100.0,
                            height: 100.0,
                            child: new RawMaterialButton(
                              shape: new CircleBorder(),
                              fillColor: Colors.white,
                              elevation: 5.0,
                              child: Icon(Icons.search, size: 50, color: GREEN),
                              onPressed: () => '{}',
                            )),
                      ),
                    )
                  ],
                ),
                color: GREEN,
              ),
            )
          ],
        ),
      ),
    );
  }
}