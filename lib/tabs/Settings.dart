import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const GREEN = Color(0xFF56B12C);
const GRAY = Color(0xFF505050);

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: GREEN,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SvgPicture.asset('img/eng.svg',
                    width: 100, height: 300,),
                ),
              ),
              label: Text('English', style: TextStyle(color: GREEN, fontWeight: FontWeight.bold),),
              backgroundColor: Colors.white,
              onDeleted: () {},
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('SP'),
              ),
              label: Text('Spanish', style: TextStyle(color: GREEN, fontWeight: FontWeight.bold),),
              backgroundColor: Colors.white,
              onDeleted: () {},
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('CH'),
              ),
              label: Text('Chinese', style: TextStyle(color: GREEN, fontWeight: FontWeight.bold),),
              backgroundColor: Colors.white,
              onDeleted: () {},
              deleteIcon: Icon(Icons.clear, color: GREEN,),
            ),
            Text('No favorites yet',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            Text('Add some sentences to conveniently access them, even offline', textAlign: TextAlign.center, style: TextStyle(
                fontSize: 15,
                color: Colors.white
            ),),
            FlatButton(
              child: Text('Search some sentences'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
