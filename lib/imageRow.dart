import 'package:flutter/material.dart';
import 'package:gallery/imageRequester.dart';

class ImageRow extends StatefulWidget {
  final ImageRequester images;
  final int rowSize;
  ImageRow({this.images, this.rowSize});

  @override
  _ImageRowState createState() => _ImageRowState();
}

class _ImageRowState extends State<ImageRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.images.pictures
          .map(
            (x) => Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/image', arguments: {
                        'url': x.url,
                      });
                    },
                    child: Container(
                      child: widget.images.loading
                          ? CircularProgressIndicator()
                          : Image(
                              image: NetworkImage(x.url),
                              fit: BoxFit.cover,
                            ),
                      margin: EdgeInsets.all(2),
                      width:
                          MediaQuery.of(context).size.width / widget.rowSize -
                              4,
                      height: MediaQuery.of(context).size.height / 7 - 4,
                    ),
                  ),
                  Container(
                    child: Text(
                      x.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.all(2),
                    width:
                        MediaQuery.of(context).size.width / widget.rowSize - 4,
                  ),
                  Container(
                    child: Text(
                      x.author,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.all(2),
                    width:
                        MediaQuery.of(context).size.width / widget.rowSize - 4,
                  ),
                ],
              ),
            ),
          )
          .toList(),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
