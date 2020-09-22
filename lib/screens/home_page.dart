import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kholo/models/cause.dart';
import 'package:kholo/widgets/cause_card.dart';
import 'package:kholo/widgets/profile_picture.dart';
import 'package:kholo/widgets/stat_card.dart';

var causes = [
  Cause(
      1,
      'Covid-19 Response',
      DateTime(2020, 4, 15),
      'Join the fight to eradicate CoVid-19 in Malawi with your generous donations',
      4334603.31,
      8200000.00,
      'https://res.cloudinary.com/tiyeni/image/upload/v1587369536/3699176.jpg'),
  Cause(
      2,
      'Chiradzulu District Hospital',
      DateTime(2020, 4, 12),
      'Join the fight to eradicate CoVid-19 in Malawi with your generous donations',
      240854.12,
      2000000.00,
      'https://res.cloudinary.com/tiyeni/image/upload/v1587369188/1542.jpg'),
  Cause(
      2,
      'Lumbadzi CDSS Rehabilitation',
      DateTime(2020, 4, 9),
      'Join the fight to eradicate CoVid-19 in Malawi with your generous donations',
      54100.00,
      670000.00,
      'https://res.cloudinary.com/tiyeni/image/upload/v1587369684/631.jpg')
];

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                width: double.infinity,
              ),
            ),
            Flexible(
              child: ClipPath(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Colors.deepOrange
                      ])),
                ),
                clipper: WaveClipper(),
              ),
            ),
          ],
        ),
          buildList(context),
      ],
    );
  }

  ListView buildList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 18),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: buildWelcome(context),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: buildStats(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Donate to Other Causes',
            style:
            Theme.of(context).textTheme.title.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          items: causes
              .map((cause) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CauseCard(cause: cause),
          ))
              .toList(),
          options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
          ),
        ),
      ],
    );
  }

  Row buildStats() {
    return Row(
      children: <Widget>[
        Flexible(
            child:
            StatCard(stat: '12', head: 'Students', subHead: 'Sponsored')),
        SizedBox(
          width: 18,
        ),
        Flexible(
            child: StatCard(
              stat: 'K65k',
              head: 'Total',
              subHead: 'Amount Donated',
              alt: true,
            )),
      ],
    );
  }

  Widget buildWelcome(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: RichText(
              text: TextSpan(
                  text: 'Welcome Back,\n',
                  style: Theme.of(context).textTheme.title,
                  children: [
                    TextSpan(
                        text: 'Veronica',
                        style: Theme.of(context).textTheme.display2)
                  ])),
        ),
        ProfilePicture()
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstControlPoint = Offset(size.width / 2, size.height / 3);
    var firstEndPoint = Offset(size.width / 1, size.height / 2);

    var secondControlPoint = Offset(size.width / 2, size.height / 2);
    var secondEndPoint = Offset(0.0, 0.0);
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}