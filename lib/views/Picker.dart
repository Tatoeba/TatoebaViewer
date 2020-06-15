import 'package:flutter/material.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Picker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: GREEN,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: GREEN, size: 34,),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 25),
                          decoration:
                          InputDecoration(border: InputBorder.none, hintText: 'search'),
                        ),
                      ),
                      GestureDetector(
                        child: Icon(Icons.close, color: GREEN, size: 34,),
                        onTap: () { Navigator.pop(context); },
                      )
                    ],
                  )
              ),
              Expanded(
                child: Container(
                  color: GREEN,
                  child: ListView(
                    children: [
                      'English',
                      'Spanish',
                      'Italian',
                      'English',
                      'Spanish',
                      'Italian',
                      'English',
                      'Spanish',
                      'Italian',
                      'English',
                      'Spanish',
                      'Italian',
                      'English',
                      'Spanish',
                      'Italian',
                      'Chinese'].map((lang) => ListTile(
                      leading: Icon(Icons.accessibility),
                      title: Text(lang, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                    )).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}