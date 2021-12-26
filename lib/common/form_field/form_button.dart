import 'package:flutter/cupertino.dart';

import 'form_field.dart';

class FormSwitch extends FormCampo {


  bool _switchValue = true;

  @override
  Widget getCustomField() {
    return CupertinoSwitch(
      value: _switchValue,
      onChanged: (value) {
        // setState(() {
        //   _switchValue = value;
        // });
      },
    );
  }

  @override
  Widget getContent() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              getTitleText(),
              getCustomField(),
            ],
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
