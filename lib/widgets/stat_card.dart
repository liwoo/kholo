import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard(
      {Key key,
        @required this.subHead,
        @required this.stat,
        @required this.head,
        this.alt = false})
      : super(key: key);

  final String subHead;
  final String head;
  final String stat;
  final bool alt;

  static const radius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(22),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                gradient: LinearGradient(colors: [
                  alt
                      ? Colors.deepPurpleAccent.withOpacity(0.7)
                      : Colors.deepOrangeAccent.withOpacity(0.7),
                  alt ? Colors.deepPurple : Colors.deepOrange
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: '$stat\n',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                        text: '$head\n',
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white, height: 2)),
                    TextSpan(
                        text: '$subHead',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.grey[300], height: 2))
                  ]),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              child: Text('My ${alt ? 'Donations' : 'Students'}'),
              padding: EdgeInsets.all(2),
              onPressed: () => print('pressed'),
              color: alt ? Colors.deepPurpleAccent : Colors.orange,
            ))
      ],
    );
  }
}
