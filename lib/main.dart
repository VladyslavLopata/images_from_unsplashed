import 'package:flutter/material.dart';
import 'home.dart';
import 'imageViewer.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/image': (context) => ImageViewer(),
      },
    ));
