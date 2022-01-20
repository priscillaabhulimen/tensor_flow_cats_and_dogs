import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF7D9E9E),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'CodedX',
              style: TextStyle(
                color: Color(0xFF004242),
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Cats and Dogs Detector App',
              style: TextStyle(
                color: Color(0xFF004242),
                fontWeight: FontWeight.w500,
                fontSize: 30
              ),
            ),
            SizedBox(height: 50,),
            Center(child: _loading ? Container(
              width: 250,
              child: Column(
                children: [
                  Image.asset('assets/cat_dog_icon.png'),
                  SizedBox(height: 50,)
                ],
              ),
            ) : Container(),),
            Container(
              width: size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: size.width - 250,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFF004242),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text(
                        'Capture Photo',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.6)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: size.width - 250,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFF004242),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text(
                        'Open Gallery',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.6)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
