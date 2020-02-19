import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {

  CenterImage({Key key,@required this.imagePath}):super(key:key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Image.network(imagePath),
    ));
  }
}
