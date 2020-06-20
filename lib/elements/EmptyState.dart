import 'package:flutter/material.dart';

import '../main.dart';

class EmptyState extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData iconName;

  EmptyState({this.title, this.subtitle, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 140,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 16),
          child: RaisedButton(
            child: Text('Search some sentences'),
            onPressed: () {
              TatoebaViewer.homePageKey.currentState.tabController.animateTo(0);
            },
          ),
        )
      ],
    );
  }
}
