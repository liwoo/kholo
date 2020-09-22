import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        buildStudentList(context),
        Text('Tab View 2'),
      ],
    );
  }

  Widget buildStudentList(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            border: Border(
              bottom: BorderSide(color: Colors.grey[300])
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(99)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://res.cloudinary.com/tiyeni/image/upload/v1582195378/white-girl.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                       children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(3))
                            ),
                            child: Text('M', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),),
                          ),
                          SizedBox(width: 4,),
                          Text('Chinsisi Ndovi (16yo)')
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Balaka Secondary School, Balaka', style: Theme.of(context).textTheme.caption,)
                    ],
                  )
                ],
              ),
              Text('Raised')
            ],
          ),
        ),
      ],
    );
  }
}
