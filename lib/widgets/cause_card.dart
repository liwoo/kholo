import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kholo/models/cause.dart';

class CauseCard extends StatelessWidget {
  final Cause cause;

  const CauseCard({Key key, this.cause}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(cause.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          FittedBox(
            child: Text(
              cause.title,
              style: Theme.of(context).textTheme.title,
            ),
            fit: BoxFit.cover,
          ),
          Text(
            DateFormat.yMMMd().format(cause.date),
          ),
          SizedBox(
            height: 22,
          ),
          Stack(
            children: <Widget>[
              buildBar(
                  width: 100.0,
                  color: Colors.deepPurpleAccent.withOpacity(0.3),
                  context: context),
              buildBar(
                  width: cause.raised / cause.target * 100,
                  color: Colors.deepPurpleAccent,
                  context: context),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                  text:
                  'Raised ${NumberFormat.currency(symbol: 'MK').format(cause.raised)}\n',
                  style: Theme.of(context).textTheme.subhead.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.green),
                  children: [
                    TextSpan(
                        text: 'Against Target of ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.black)),
                    TextSpan(
                        text: NumberFormat.currency(symbol: 'MK')
                            .format(cause.target),
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: CupertinoButton(
              child: Text('Find out More'),
              onPressed: () => print('printing...'),
              color: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
    );
  }

  Container buildBar({double width, Color color, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * (width / 100),
      height: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)), color: color),
    );
  }
}

