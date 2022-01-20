import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;

  XFile _image;
  List _output;
  final picker = ImagePicker();

  detectImage(XFile img) async {
    var output = await Tflite.runModelOnImage(
        path: img.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5
    );

    setState(() {
      _output = output;
      _loading = false;
    });
  }
  
  loadModel() async{
    await Tflite.loadModel(model: 'assets/learning_model/model_unquant.tflite', labels: 'assets/learning_model/labels.txt');
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value){
      setState(() {

      });
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  takePhoto() async{
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null){
      return null;
    }
    setState(() {
      _image = XFile(image.path);
    });

    detectImage(_image);
  }

  pickImage() async{
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null){
      return null;
    }
    setState(() {
      _image = XFile(image.path);
    });

    detectImage(_image);
  }

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
            SizedBox(
              height: 5,
            ),
            Text(
              'Cats and Dogs Detector App',
              style: TextStyle(
                  color: Color(0xFF004242),
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: _loading
                  ? Container(
                      width: 250,
                      child: Column(
                        children: [
                          Image.asset('assets/cat_dog_icon.png'),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )
                  : Container(),
            ),
            Container(
              width: size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: takePhoto,
                    child: Container(
                      width: size.width - 250,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFF004242),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Capture Photo',
                        style: TextStyle(color: Colors.white.withOpacity(.6)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: size.width - 250,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFF004242),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Open Gallery',
                        style: TextStyle(color: Colors.white.withOpacity(.6)),
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
