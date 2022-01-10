import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDynamic extends StatelessWidget {
  static int countIcon = 0;

  const IconDynamic(
      {Key? key,
        required this.primary,
        required this.secondary,
        this.size = 16})
      : super(key: key);

  final IconData primary;
  final IconData secondary;
  final double size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconTheme(
      data: Theme.of(context).primaryIconTheme,
      child: Icon(
        ++countIcon % 2 != 0 ? primary : secondary,
        size: size,
      ),
    );
  }
}