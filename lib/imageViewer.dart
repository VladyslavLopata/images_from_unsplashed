import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Image(
        image: NetworkImage(data['url']),
      ),
    );
  }
}
