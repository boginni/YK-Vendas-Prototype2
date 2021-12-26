import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, this.icon, this.title, this.onPressMethod})
      : super(key: key);

  final Function? onPressMethod;
  final IconData? icon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          onPressMethod!();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileText extends StatelessWidget {
  const TileText({Key? key, this.title, this.value}) : super(key: key);

  final title;
  final value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900])),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(value,
                  style: TextStyle(fontSize: 18, color: Colors.grey[500])),
            ),
          ],
        ),
      ),
    );
  }
}
