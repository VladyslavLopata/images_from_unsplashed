import 'package:gallery/picture.dart';
import 'dart:convert';

import 'package:http/http.dart';

//to request all required only when needed
class ImageRequester {
  bool loading = false;
  List<Picture> pictures;
  final String id =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  ImageRequester() {
    pictures = List();
  }

  Future<void> makeRequest({int itemCount = 100}) async {
    loading = true;
    //request $itemCount of images
    Response response = await get(
        'https://api.unsplash.com/photos/random?client_id=$id&count=$itemCount');

    List requestedPictures = json.decode(response.body);

    //Create Picture class objects from request
    //and push them to the list of pictures
    //if no description for image is provided, use alt_description
    //or just author user name
    pictures.addAll(requestedPictures
        .map((e) => Picture(
            url: e['urls']['regular'],
            name: e['description'] ??
                (e['alt_description'] ?? 'Photo by ${e["user"]["username"]}'),
            author: e["user"]["name"]))
        .take(itemCount));
    loading = false;
  }

  String editName([String name]) {
    if (name == null) {
      return null;
    }
    if (name.length > 20) {
      return name.substring(0, 20);
    }
    return name;
  }
}
