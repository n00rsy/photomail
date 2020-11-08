import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'email.dart';
import 'package:flutter/foundation.dart';
import 'parser.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';

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

upload(File imageFile) async {
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse("http://36029840fc10.ngrok.io/");

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(imageFile.path));

  // add file to multipart
  request.files.add(multipartFile);

  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
    Map<String, dynamic> res = jsonDecode(value);
    var emailData = parseString(res['response']);
    launchMailto(emailData[0], emailData[1]);
  });
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
  
  void sendToServer(FormData formData) async {
    print("sending post request");

    var email = parseString("test string");

    // send email
    if(email != null)
      launchMailto(email[0], email[1]);
  }

  void getImage () async  {
    debugPrint('movieTitle');
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() async{
     if (pickedFile != null) {
       _image = File(pickedFile.path);
       // send POST request to google
       upload(_image);

     }
     else {
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
