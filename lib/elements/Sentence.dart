import 'package:flutter/material.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Sentence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('img/zhi.png', width: 40, height: 40,),
    Expanded(child: SizedBox(height: 10,)),
              Icon(Icons.favorite_border, color: GREEN, size: 25,),
              SizedBox(width: 10,),
              Icon(Icons.open_in_new, color: GREEN, size: 25,),
              SizedBox(width: 10,),
              Icon(Icons.content_copy, color: GREEN, size: 25,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text('生意停顿了以后，许多公共浴堂都添置了桑拿浴室', style: TextStyle(fontSize: 25),),
          ),
          Divider(
            color: GREEN,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(children: [
              Image.asset('img/eng.png', width: 24, height: 24,),
              SizedBox(width: 8,),
              Expanded(child: Text('After business came to a halt, many bathhouses added new facilities, such as saunas', style: TextStyle(fontSize: 18),)),
              Icon(Icons.more_vert, color: GREEN, size: 25,)
            ], crossAxisAlignment: CrossAxisAlignment.start,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(children: [
              Image.asset('img/jap.png', width: 24, height: 24,),
              SizedBox(width: 8,),
              Expanded(child: Text('商卖をやめるところも多くなった。しかし浴场の所有者の中には、客集めをねらって、', style: TextStyle(fontSize: 18),)),
              Icon(Icons.more_vert, color: GREEN, size: 25,)
            ], crossAxisAlignment: CrossAxisAlignment.start,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('5 other translations', style: TextStyle(color: GREEN, fontWeight: FontWeight.bold, fontSize: 16),),
                Icon(Icons.keyboard_arrow_down, color: GREEN, size: 25,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
