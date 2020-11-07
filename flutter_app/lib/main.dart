import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'email.dart';
import 'package:flutter/foundation.dart';
import 'parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'PhotoMail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  void getImage () async  {
    debugPrint('movieTitle');
    launchMailto("ridhwaan.any@gmail.com", "Hi this is an email. I am happy");

    print("getting image");
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
     if (pickedFile != null) {
       _image = File(pickedFile.path);

       // send POST request to google


       parseString("test string");

       // send email
       launchMailto("ridhwaan.any@gmail.com", "Hi this is an email. I am happy");
     } else {
       print('No image selected.');
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: getImage,
                child:
                Text(
                    "Take Picture",
                  style: TextStyle(fontSize: 50),
                ))
          ],
        ),
      ),
    );
  }
}
