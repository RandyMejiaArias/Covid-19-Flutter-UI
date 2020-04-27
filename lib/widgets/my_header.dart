import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid_19_ui/info_screen.dart';
import 'package:covid_19_ui/constant.dart';

class MyHearder extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHearder({
    Key key, this.image, this.textTop, this.textBottom, this.offset,
  }) : super(key: key);

  @override
  _MyHearderState createState() => _MyHearderState();
}

class _MyHearderState extends State<MyHearder> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF112494)
            ]
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return InfoScreen();
                      }
                    )
                  );
                },
                child: SvgPicture.asset("assets/icons/menu.svg"))
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    widget.image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(), //Doesn't works without container 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height -80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

}