import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarPhotoWidget extends StatelessWidget {
  final double height;
  final String imgUrl;

  const CarPhotoWidget({Key key, @required this.height, @required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: CachedNetworkImage(
        height: height,
        fit: BoxFit.contain,
        imageUrl: imgUrl,
        placeholder: (context, url) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(),
            Text("Loading automobile photo...")
          ],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
