import 'package:flutter/material.dart';
import 'package:gallery/imageRequester.dart';
import 'imageRow.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int rowSize = 3;

  Future<List<ImageRequester>> _initImages() async {
    List<ImageRequester> imageList = new List();
    for (var i = 0; i < 7; i++) {
      ImageRequester requester = ImageRequester();
      await requester.makeRequest(itemCount: rowSize);
      imageList.add(requester);
    }
    return imageList;
  }

  @override
  void initState() {
    super.initState();
    //initImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.grey[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: FutureBuilder(
              future: _initImages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ImageRow(
                      images: snapshot.data.elementAt(index), rowSize: rowSize),
                );
              })),
    );
  }
}
