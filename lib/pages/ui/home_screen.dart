import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainImage = Image.asset(
      'assets/images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    final headerSection = Container(
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41')
        ],
      ),
    );

    final iconSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.call,
                color: Colors.blue[400],
              ),
              Text(
                'CALL',
                style: TextStyle(
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.near_me,
                color: Colors.blue[400],
              ),
              Text(
                'ROUTE',
                style: TextStyle(
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.blue[400],
              ),
              Text(
                'SHARE',
                style: TextStyle(
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final textSection = Container(
      padding: EdgeInsets.all(24),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      body: ListView(children: [
        Container(child: mainImage),
        Container(child: headerSection),
        Container(child: iconSection),
        Container(child: textSection),
      ]),
    );
  }
}
